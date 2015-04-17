require 'minitest/autorun'
require_relative './dictionary_entry.rb'

class DictionaryEntryTest < MiniTest::Test

  def test_output_with_1_definition_and_1_example
    unobtrusive_entry = DictionaryEntry.new "unobtrusive"
    expected_output="unobtrusive
not noticeable; seeming to fit in well with the things around:

Examples:

Make-up this season is unobtrusive and natural-looking.

Source: Cambridge Dictionaries Online / British English
http://dictionary.cambridge.org/dictionary/british/unobtrusive
"

    assert_equal expected_output, unobtrusive_entry.output
  end

  def test_output_with_1_definition_3_examples
    compulsory_entry = DictionaryEntry.new "compulsory"
    expected_output="compulsory
If something is compulsory, you must do it because of a rule or law:

Examples:

Swimming was compulsory at my school.
The law made wearing seat belts in cars compulsory.
Patients can now be compulsorily detained in hospital only under tightly drawn criteria.

Source: Cambridge Dictionaries Online / British English
http://dictionary.cambridge.org/dictionary/british/compulsory
"

    assert_equal expected_output, compulsory_entry.output
    
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

    assert_equal expected_output, immense_entry.output
  end
  
end
