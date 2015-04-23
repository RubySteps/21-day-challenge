require 'psych'
require 'sequel'
require 'mysql2'


class DatabaseInfo
  attr_reader :host, :adapter, :database, :username, :password

  DB_YML_FILE = File.join(File.expand_path("../../..", __FILE__),
                          "config/database.yml")

  # Initialize with an options hash with the following possible keys:
  #   env: environment to pull from database.yml
  #   filename: path and name of database.yml
  def initialize(options={})
    env = options.fetch(:env) { "staging" }
    filename = options.fetch(:filename) { DB_YML_FILE }

    db_info = Psych.load_file(filename)[env]
    @host = db_info["host"]
    @adapter = db_info["adapter"]
    @database = db_info["database"]
    @username = db_info["username"]
    @password = db_info["password"]
  end

  def dbconnect
    Sequel.connect("#{adapter}://#{username}:#{password}@#{host}:3306/#{database}")
  end
end
