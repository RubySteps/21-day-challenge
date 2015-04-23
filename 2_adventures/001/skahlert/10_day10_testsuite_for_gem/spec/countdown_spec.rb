require '21_day_challenge_countdown'
describe TwentyOneDayChallenge::Countdown do
  context 'creation' do
    it 'can be initialized with date' do
      expect(described_class.new(DateTime.new))
        .to be_a(TwentyOneDayChallenge::Countdown)
    end

    it 'expects anchor to use default time' do
      expect(subject.anchor).to eq(DateTime.new(2015, 4, 13, 12, 0, 0, '-6'))
    end
  end

  context 'calculation' do
    let(:tenth_day) { Time.new(2015, 4, 23, 11, 0, 0) }
    let(:first_day) { Time.new(2015, 4, 14, 11, 0, 0) }

    let(:one_hour_mountain) { Time.new(2015, 4, 14, 11, 0, 0, '-06:00') }
    let(:thirty_min_utc) { Time.new(2015, 4, 16, 17, 30, 0, '+00:00') }

    it '10th day is calculated correctly' do
      allow(Time).to receive(:now).and_return(tenth_day)
      expect(subject.current_day).to eq(10)
    end

    it '1st day is calculated correctly' do
      allow(Time).to receive(:now).and_return(first_day)
      expect(subject.current_day).to eq(1)
    end

    it 'calculates 1hr remaining in Mountain Time time correctly' do
      allow(Time).to receive(:now).and_return(one_hour_mountain)
      expect(subject.time_left.to_i).to eq(3600)
    end

    it 'calculates 30min remaining in UTC time correctly' do
      allow(Time).to receive(:now).and_return(thirty_min_utc)
      expect(subject.time_left.to_i).to eq(30 * 60)
    end
  end
end
