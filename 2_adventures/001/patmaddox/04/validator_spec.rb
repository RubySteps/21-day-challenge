require_relative 'validator'

describe Validator do
  describe '#validate_pull(pull)' do
    context 'a valid pull' do
      let(:pull) do
        {
          number: 123,

          user: {
            login: 'github-user'
          },

          labels: [],

          filenames: [
            '1_warmup/github-user/01/README.md',
            '2_adventures/001/github-user/01/README.md'
          ]
        }
      end

      it 'returns a success object' do
        response = validate_pull pull
        expect(response[:success]).to eq(true)
        expect(response[:message]).to be_present
      end

      it 'allows README.txt as an alternative to README.md'

      it 'allows README as an alternative to README.md'

      it 'ignores case for README files'
    end

    context 'an invalid pull' do
      it 'checks that a pull only touches files in a user\'s personal directory'

      it 'checks that a pull includes a directory for that day of the challenge'

      it 'checks for a README.md in the day directory'
    end
  end
end
