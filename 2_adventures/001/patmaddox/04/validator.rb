require 'octokit'

Octokit.auto_paginate = true

REPO_NAME = 'RubySteps/21-day-challenge'

class Validator
  def validate_pull(pull)
    message_parts = []

    invalid_filenames = pull[:filenames].reject {|f|
      f.downcase.index("1_warmup/#{pull[:user][:login].downcase}/") == 0 ||
        f.downcase.index("2_adventures/002/#{pull[:user][:login].downcase}/") == 0
    }

    if invalid_filenames.any?
      message_parts << %<Your pull request contains changes to files outside of the challenge and warmup directories. Please fix it!\n\n#{invalid_filenames.join("\n")}>
    end

    unless pull[:filenames].all? {|f| f.downcase.index("1_warmup") == 0 }
      unless %w(readme.md readme.txt readme).any? {|r|
               pull[:filenames].any? {|f| f.downcase =~ /^2_adventures\/002\/#{pull[:user][:login].downcase}\/\d\d([-_]\S*)?\/#{r}$/ } }
        message_parts << 'Where\'s the README? :('
      end
    end

    {
      success: message_parts.empty?,
      labels: message_parts.empty?? ['checked-pass'] : ['checked-fail'],
      message: message_parts.any?? message_parts.join("\n\n----\n\n") : 'Go you!'
    }
  end

  def validate_pulls
    client = Octokit::Client.new netrc: true
    client.login

    pulls = client.pulls REPO_NAME, state: 'open'

    pulls.each do |pull|
      issue = client.issue REPO_NAME, pull[:number]
      next if issue[:labels].any?

      puts "Pull: #{pull[:number]}"
      next if pull[:user][:login] == "patmaddox" # because I get to do whatever I want :P

      files = client.pull_files REPO_NAME, pull[:number]
      pull[:filenames] = files.map {|f| f[:filename] }

      response = validate_pull pull

      client.update_issue REPO_NAME, pull[:number], labels: response[:labels]
      client.add_comment REPO_NAME, pull[:number], response[:message]
    end
  end
end
