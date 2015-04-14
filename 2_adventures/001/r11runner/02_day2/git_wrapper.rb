module GitWrapper

  def self.clone_repo_from_github user_name, repo_name
    system "git clone https://github.com/#{user_name}/#{repo_name}.git"
    puts "Cloned the GitHub-repo"
  end

  def self.config_user user_name
    system "git config user.name #{user_name}"
    system "git config user.email #{user_name}"
  end

  def self.create_branch branch_name
    system "git checkout -b #{branch_name}"
    puts "Created branch #{branch_name}"
  end

  def self.commit_all_changes commit_message
    system "git add ."
    system "git commit -m \"#{commit_message}\""
  end

  def self.push_to_origin branch_name
    system "git push origin #{branch_name}"
    puts "Check your branch #{branch_name} on GitHub"
  end

end
