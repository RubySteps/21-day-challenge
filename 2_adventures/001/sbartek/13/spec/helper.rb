require 'minitest/autorun'

Dir["./app/models/*.rb"].each do |fn|
  require fn
end

