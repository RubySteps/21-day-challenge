module Ladida
  class Greeter
    def hello_world(language='en')
      case language
      when 'en'
        puts "Hello world!"
      when 'jp'
        puts "Konnichiwa sekai!"
      when 'my'
        puts "Selamat siang, dunia!"
      when 'cn'
        puts "Ni hao, shi jie!"
      else
        raise "USE A VALID LANGUAGE!"
      end
    end
  end
end
