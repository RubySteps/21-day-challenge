require_relative 'validator'

describe Validator do
  let(:validator) { Validator.new }

  describe '#validate_pull(pull, day)' do
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

    let(:response) { validator.validate_pull pull, '01' }

    context 'a valid pull' do
      it 'returns a success object' do
        expect(response[:success]).to eq(true)
        expect(response[:message]).to_not be_empty
      end

      it 'allows README.txt as an alternative to README.md' do
        pull[:filenames] = ['2_adventures/001/github-user/01/README.txt']

        expect(response[:success]).to eq(true)
      end

      it 'allows README as an alternative to README.md' do
        pull[:filenames] = ['2_adventures/001/github-user/01/README']

        expect(response[:success]).to eq(true)
      end

      it 'ignores case for README files'

      it 'ignores case for the username'

      it 'allows warmup-only filenames'
    end

    context 'an invalid pull' do
      it 'checks that a pull only touches files in a user\'s personal directory' do
        pull[:filenames] << 'invalid_file'

        expect(response[:success]).to eq(false)
        expect(response[:message]).to include('invalid_file')
      end

      it 'checks that a pull includes a directory for that day of the challenge' do
        pull[:filenames] = ['2_adventures/001/github-user/02/README.md']

        expect(response[:success]).to eq(false)
        expect(response[:message]).to include('Expected Day: 01',
                                              '2_adventures/001/github-user/02/README.md'
                                              )
      end

      it 'checks for a README.md in the day directory' do
        pull[:filenames] = ['2_adventures/001/github-user/01/NOT_README']

        expect(response[:success]).to eq(false)
        expect(response[:message]).to include('Where\'s the README? :(')
      end
    end
  end
end
