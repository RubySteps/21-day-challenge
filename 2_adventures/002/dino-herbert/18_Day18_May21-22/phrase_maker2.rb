def create_lists
  @word_list_1 = %w(
    24/7 multi-tiered 30,000\ feet B-to-B win-win front-end web-based pervasive
    smart six-sigma critical\ path dynamic)
  @word_list_2 = %w(
    empowered sticky value-added oriented centric distributed clustered
    branded outside-the-box positioned networked focused leveraged aligned
    targeted shared cooperative accelerated)
  @word_list_3 = %w(
    process tipping-point solution architecture core\ competency strategy
    mindshare portal space vision paradigm mission)
end

def make_phrase
  one_length = @word_list_1.length
  two_length = @word_list_2.length
  three_length = @word_list_3.length

  rand1 = rand(one_length)
  rand2 = rand(two_length)
  rand3 = rand(three_length)

  @phrase =
  @word_list_1[rand1] + ' ' + @word_list_2[rand2] + ' ' + @word_list_3[rand3]
end

create_lists
make_phrase
puts 'What we need now is a ' + @phrase + '.'
