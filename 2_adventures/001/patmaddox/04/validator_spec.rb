require_relative 'validator'

describe Validator do
  describe '#validate_pulls' do
    it 'checks that a pull only touches files in a user\'s personal directory'

    it 'checks that a pull includes a directory for that day of the challenge'

    it 'checks for a README.md in the day directory'

    it 'allows README.txt as an alternative to README.md'

    it 'allows README as an alternative to README.md'

    it 'ignores case for README files'
  end
end
