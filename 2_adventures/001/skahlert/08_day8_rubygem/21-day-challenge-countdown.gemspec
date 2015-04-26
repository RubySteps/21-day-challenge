Gem::Specification.new do |s|
  s.name        = '21-day-challenge-countdown'
  s.version     = '0.1.1'
  s.required_ruby_version = '>= 1.9.3'
  s.executables << 'challenge_countdown'
  s.date        = '2015-04-21'
  s.summary     = "Deadline countdown"
  s.description = "Gives you a countdown to the next 21-day-challenge deadline"
  s.authors     = ["Stefan Kahlert"]
  s.email       = 'kahlert@gmail.com'
  s.files       = ["lib/21-day-challenge-countdown.rb","README.md"]
  s.homepage    =
    'https://github.com/RubySteps/21-day-challenge'
  s.license       = 'MIT'
  s.add_dependency 'activesupport','~> 4.2.1'
end
