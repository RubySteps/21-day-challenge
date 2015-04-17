require 'rubygems'
require 'bundler/setup'

# Config
ADVENTURE_PATH = ARGV[0]


# Holds the stat of a challenge user
class ChallengeUser
  def initialize(user)
    @user = user
  end
end

# Hold statistics for users
class ChallengeUserStats
  def initialize
    @challenge_user_map = {}
  end

  def add(user, user_path, day_folder)
    challenge_user = get_challenge_user(user)
  end

  def get_challenge_user(user)
    unless @challenge_user_map.has_key?(user)
      @challenge_user_map[user] = ChallengeUser.new(user, user_path)
    end

    @challenge_user_map[user]
  end
end

# Holds the statistics for a day
class ChallengeDay
  def initialize(day)
    @day = day
    @challenge_user_stat = ChallengeUserStats.new
  end

  def add(user, user_path, day_folder)
    @challenge_user_stat.add(user, user_path, day_folder)
  end

  def get_stat
    stat = {}
  end
end

# Holds the dialy statistics
class ChallengeDayStats
  def initialize
    @day_map = {}
  end

  def add_day(user, user_path, day_folder)
    unless (day_folder =~ /^\d{2}.*/).nil?
      actual_day = day[0, 2].to_i

      day_stat = get_challenge_day(actual_day)
      day_stat.add(user, user_path, day_folder)
    end
  end

  def get_challenge_day(day)
    unless @day_map.has_key?(day)
      @day_map[day] = ChallengeDay.new(day)
    end

    @day_map[day]
  end

  def get_stats
    stat = []

    for day in @day_map.keys.sort
      stat << @day_map[day].get_stat
    end
  end
end

# Holds the entire statistics for the challenge
class ChallengeStats
  def initialize(path)
    @path = path

    # Stats
    @challenge_day_stats = ChallengeDayStats.new
  end

  def calculate
    Dir.entries(@path).select {|entry|
      next if (entry == '.' || entry == '..' || entry == 'README.md')

      calculate_user(entry, @path + entry)
    }
  end

  def calculate_user(user, user_path)
    Dir.entries(user_path).select {|entry|
      next if (entry == '.' || entry == '..' || entry == 'README.md')

      @challenge_day_stats.add_day(user, user_path, day_folder)
    }
  end

  def get_stats
    {days: @challenge_day_stats.get_stats}
  end
end

ChallengeStats.new(ADVENTURE_PATH).calculate
