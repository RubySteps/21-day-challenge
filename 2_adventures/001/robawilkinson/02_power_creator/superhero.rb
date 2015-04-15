require 'csv'

class Superhero
  @@adjectives = ["mega","super","epic"]
  @@superpowers = CSV.read('superhero_data.csv')
  @@superpowers.flatten!
  def self.power
    "#{@@adjectives.sample} #{@@superpowers.sample.downcase}"
  end
end
