def make_phrase
  
  word_list_1 = ["24/7", "multi-tiered", "30,000 feet", "B-to-B", "win-win", "front-end", "web-based", "pervasive", "smart", "six-sigma", "critical path", "dynamic"]
    
  word_list_2 = ["empowered", "sticky", "value-added", "oriented", "centric", "distributed", "clustered", "branded", "outside-the-box", "positioned", "networked", "focused", "leveraged", "aligned", "targeted", "shared", "cooperative", "accelerated"]
    
  word_list_3 = ["process", "tipping point", "solution", "architecture", "core competency", "strategy", "mindshare", "portal", "space", "vision", "paradigm", "mission"]
    
  oneLength = word_list_1.length;
  twoLength = word_list_2.length;
  threeLength = word_list_3.length;
  
  rand1 = rand(oneLength)
  rand2 = rand(twoLength)
  rand3 = rand(threeLength)
    
  phrase = word_list_1[rand1] + " " + word_list_2[rand2] + " " + word_list_3[rand3];
    
  puts "What we need now is a " + phrase + "." 
end    
make_phrase  
    
    