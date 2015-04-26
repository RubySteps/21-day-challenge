Dir["./#{File.dirname(__FILE__)}/*_spec.rb"].each do |fn|
  require fn
end
