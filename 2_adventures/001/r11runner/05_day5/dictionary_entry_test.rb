require 'minitest/autorun'
require_relative './dictionary_entry.rb'

class DictionaryEntryTest < MiniTest::Test

  def test_output_with_1_definition_and_1_example
    expected_output="unobtrusive
not noticeable; seeming to fit in well with the things around:

Examples:

Make-up this season is unobtrusive and natural-looking.

Source: Cambridge Dictionaries Online / British English
http://dictionary.cambridge.org/dictionary/british/unobtrusive
"

    check_output_for_word "unobtrusive", expected_output
  end

  def test_output_with_1_definition_3_examples
    expected_output="compulsory
If something is compulsory, you must do it because of a rule or law:

Examples:

Swimming was compulsory at my school.
The law made wearing seat belts in cars compulsory.
Patients can now be compulsorily detained in hospital only under tightly drawn criteria.

Source: Cambridge Dictionaries Online / British English
http://dictionary.cambridge.org/dictionary/british/compulsory
"

    check_output_for_word "compulsory", expected_output
  end

  def test_output_with_2_definitions_3_examples
    immense_entry = DictionaryEntry.new "immense"
    expected_output = "immense
extremely large in size or degree:
extremely good:

Examples:

immense wealth/value
They spent an immense amount of time getting the engine into perfect condition.
He's an immense goalkeeper.

Source: Cambridge Dictionaries Online / British English
http://dictionary.cambridge.org/dictionary/british/immense
"

    check_output_for_word "immense", expected_output
  end

  private
  def check_output_for_word searched_word, expected_output
    dictionary_entry = DictionaryEntry.new searched_word
    assert_equal expected_output, dictionary_entry.output
  end
  
end
