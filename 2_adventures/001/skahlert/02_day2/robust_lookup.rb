## conveniece method
class String
  def to_identifier
    self.upcase.gsub(/[^A-Z]/,"")
  end
end
class Taxonomy
  def self.find_by_identifier(str)
    keywords=[
      {title:"Ruby on Rails"},
      {title:"development"},
      {title:"21 day challenge"},
      {title:"Github"},
    ]
    keywords.each do |keyword|
      return keyword if keyword[:title].to_identifier ==str.to_identifier
    end
  end
end


keyword1 = Taxonomy.find_by_identifier("ruby on rails")
# => {:title=>"Ruby on Rails"}
keyword2 = Taxonomy.find_by_identifier("21-Day-challenge")
# => {:title=>"21 day challenge"}
