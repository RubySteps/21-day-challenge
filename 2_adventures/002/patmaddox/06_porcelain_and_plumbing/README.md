# Check your status in the 21-Day Challenge

Just some ideas on how this tool might work.

## Command-line porcelain

```bash
rs21 status # check my status in the challenge
rs21 report # report everyone's status

rs21 status --adventure=002 --username=patmaddox
# maybe we pull from ~/.rubysteps
```

## Object-level plumbing

```ruby
Challenge
Adventure
Adventurer # User
Status
Report
PullRequest

adventure = Adventure.new 2
adventure = Challenge.new 2

status = adventure.status('patmaddox')
report = adventure.report

p status
p report

def status(username)
  # check the username exists in warmup directory 1 & 2
  check_warmup 1, username
  check_warmup 2, username

  # check username exists in adventure directory

  # check each day from 1 to 21 for the user
  1.to(21).each {|i| check_days_work(i, username) }

  # check pull requests...
  FANCY_GITHUB_API.check_pull_requests username
end
```
