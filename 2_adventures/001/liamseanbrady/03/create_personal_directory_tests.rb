require 'minitest/autorun'
require './create_personal_directory.rb'

class Tests < Minitest::Test
  def test_creates_new_directory
    directory_name = 'liamseanbrady'

    Challenge.new.create_dir(directory_name)

    assert_equal(Dir.exist?(directory_name), true)
  end
end
