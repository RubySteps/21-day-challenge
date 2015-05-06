require_relative 'validator'

describe Validator do
  let(:validator) { Validator.new }

  describe '#validate_pull(pull)' do
    let(:pull) do
      {
        number: 123,

        user: {
          login: 'github-user'
        },

        labels: [],

        filenames: [
          '1_warmup/github-user/01/README.md',
          '2_adventures/002/github-user/01/README.md'
        ]
      }
    end

    let(:response) { validator.validate_pull pull }

    context 'a valid pull' do
      it 'returns a success object' do
        expect(response[:success]).to eq(true)
        expect(response[:message]).to_not be_empty
        expect(response[:labels]).to match_array(['checked-pass'])
      end

      it 'allows README.txt as an alternative to README.md' do
        pull[:filenames] = ['2_adventures/002/github-user/01/README.txt']

        expect(response[:success]).to eq(true), response[:message]
      end

      it 'allows README as an alternative to README.md' do
        pull[:filenames] = ['2_adventures/002/github-user/01/README']

        expect(response[:success]).to eq(true), response[:message]
      end

      it 'ignores case for README files' do
        pull[:filenames] = ['2_adventures/002/github-user/01/readme.md']

        expect(response[:success]).to eq(true), response[:message]
      end

      it 'ignores case for the username' do
        pull[:filenames] << '2_adventures/002/GitHub-User/01/file.rb'

        expect(response[:success]).to eq(true), response[:message]
      end

      it 'allows a - extension for a day directory' do
        pull[:filenames] = ['2_adventures/002/github-user/01-ext/readme.md']

        expect(response[:success]).to eq(true), response[:message]
      end

      it 'allows a _ extension for a day directory' do
        pull[:filenames] = ['2_adventures/002/github-user/01_ext/readme.md']

        expect(response[:success]).to eq(true), response[:message]
      end

      it 'allows warmup-only filenames' do
        pull[:filenames] = ['1_warmup/github-user/01/README.md']

        expect(response[:success]).to eq(true), response[:message]
      end

      it 'allows a - extension for a warmup directory'

      it 'allowa a _ extension for a warmup directory'
    end

    context 'an invalid pull' do
      it 'checks that a pull only touches files in a user\'s personal directory' do
        pull[:filenames] << 'invalid_file'

        expect(response[:success]).to eq(false)
        expect(response[:message]).to include('invalid_file')
        expect(response[:labels]).to match_array(['checked-fail'])
      end

      it 'checks for a README.md in the day directory' do
        pull[:filenames] = ['2_adventures/002/github-user/01/NOT_README']

        expect(response[:success]).to eq(false)
        expect(response[:message]).to include('Where\'s the README? :(')
      end

      xit 'checks for a README.md in the warmup directory' do
        pull[:filenames] = ['1_warmup/github-user/01/NOT_README']

        expect(response[:success]).to eq(false)
        expect(response[:message]).to include('Where\'s the README? :(')
      end
    end
  end
end
