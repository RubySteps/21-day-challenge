require "octokit"

REPO_NAME = 'RubySteps/21-day-challenge'

client = Octokit::Client.new netrc: true
client.login

pulls = client.pulls REPO_NAME, state: 'open'

pulls.each do |pull|
  issue = client.issue REPO_NAME, pull[:number]
  next if issue[:labels].any?

  puts "Pull: #{pull[:number]}"
  username = pull[:user][:login].downcase
  next if username == "patmaddox" # because I get to do whatever I want :P

  files = client.pull_files REPO_NAME, pull[:number]

  filenames = files.map {|f| f[:filename].downcase }

  valid_file_names = filenames.select {|f|
    f.index("1_warmup/#{username}/") == 0 ||
      f.index("2_adventures/001/#{username}/") == 0
  }

  invalid_file_names = filenames - valid_file_names

  if invalid_file_names.any?
    client.update_issue REPO_NAME, pull[:number], labels: ['invalid']
    client.add_comment REPO_NAME, pull[:number], %<Your pull request contains changes to files outside of the challenge and warmup directories. Please fix it!\n\n#{invalid_file_names.join("\n")}>
  else
    client.update_issue REPO_NAME, pull[:number], labels: ['help wanted']
    client.add_comment REPO_NAME, pull[:number], 'This pull request appears modify only your own files - nice work! Now it just needs final review from a human... (this comment was auto-generated :)'
  end
end
