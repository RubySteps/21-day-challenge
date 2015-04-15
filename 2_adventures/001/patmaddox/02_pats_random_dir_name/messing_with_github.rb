require "octokit"

client = Octokit::Client.new netrc: true
p client.login
