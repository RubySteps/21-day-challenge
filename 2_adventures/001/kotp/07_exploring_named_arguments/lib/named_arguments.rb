class NamedArguments
  attr_reader :user, :host
  def initialize(username = 'user not provided', hostname = 'host not provided', user: username, host: hostname)
   @host = host
   @user = user
  end
end
