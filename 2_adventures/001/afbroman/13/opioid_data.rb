require "csv"
require_relative 'database_connect.rb'

class OpioidData

  MULTIPLIERS = { "Fentanyl" => 83.33,
                  "Hydromorphone" => 5,
                  "Methadone" => 4,
                  "Morphine" => 1,
                  "Oxycodone" => 1.33,
                  "Pethidine" => 0.25 }

  DB = DatabaseInfo.new(env: "development").dbconnect

  def fetch(start_year="1980", end_year="2012")
    drugs_array = [2,3,4,5,6,7]

    CSV.open("opioids.csv", "wb") do |csv|
      write_line(csv,
                 %w[Year] + get_drug_display_names(drugs_array) + ["Total ME"])
      (start_year..end_year).each do |year|
        curr_line = [year]
        global_pop = get_global_population(year)
        drugs_array.each do |drug_id|
          temp = DB[:consumptions].where(drug_id: drug_id, year: year)
          temp_kg = temp.sum(:kg) * MULTIPLIERS[get_drug_name_from_id(drug_id)]
          curr_line << temp_kg * 1_000_000 / global_pop
        end
        me_kg = calculate_global_kg(year, "Morphine Equivalence")
        curr_line << me_kg * 1_000_000 / global_pop
        write_line(csv, curr_line)
      end
    end
  end


  private

  def write_line(csv, arry)
    csv << arry
  end


  def get_drug_name_from_id(drug_id)
    DB[:drugs].where(id: drug_id).get(:name)
  end

  def get_drug_display_names(id_array)
    id_array.map do |id|
      name = get_drug_name_from_id(id)
      name == "morphine" ? name : name + " me"
    end
  end

  def get_global_population(year)
    populations = get_population_data
    Integer(populations[year]["global"])
  end

  def calculate_global_kg(year, drug_name="morphine equivalence")
    DB[:consumptions].join(:drugs, id: :drug_id).where(drugs__name: drug_name, year: year).sum(:kg)
  end

  def get_population_data
    who_file = "who_populations.csv"
    populations = CSV.read(who_file)
    pop_hash = Hash.new
    fields = populations[0]

    fields_lines = fields[1..-1].zip((1..7).to_a)

    populations.drop(1).each do |line|
      curr = pop_hash[line[0]] = Hash.new
      fields_lines.each do |field, line_num|
        curr[field] = line[line_num]
      end
    end
    pop_hash
  end
end
