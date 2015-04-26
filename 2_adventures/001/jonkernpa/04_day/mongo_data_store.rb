require 'mongo'
require 'dragonfly'

Dragonfly::App.register_datastore(:mongo){ Dragonfly::MongoDataStore }

module Dragonfly
  class MongoDataStore

    include Serializer

    def initialize(opts={})
      @host            = opts[:host]
      @hosts           = opts[:hosts]
      @connection_opts = opts[:connection_opts] || {}
      @port            = opts[:port]
      @database        = opts[:database] || 'dragonfly'
      @username        = opts[:username]
      @password        = opts[:password]
      @connection      = opts[:connection]
      @db              = opts[:db]
    end

    attr_accessor :host, :hosts, :connection_opts, :port, :database, :username, :password

    def write(content, opts={})
      ensure_authenticated!
      content.file do |f|
        mongo_id = grid.put(f, :content_type => content.mime_type, :metadata => content.meta)
        mongo_id.to_s
      end
    end

    def read(uid)
      ensure_authenticated!
      grid_io = grid.get(bson_id(uid))
      meta = extract_meta(grid_io)
      [grid_io.read, meta]
    rescue Mongo::GridFileNotFound, BSON::InvalidObjectId => e
      nil
    end

    def destroy(uid)
      ensure_authenticated!
      grid.delete(bson_id(uid))
    rescue Mongo::GridFileNotFound, BSON::InvalidObjectId => e
      Dragonfly.warn("#{self.class.name} destroy error: #{e}")
    end

    def connection
      @connection ||= if hosts
                        Mongo::ReplSetConnection.new(hosts, connection_opts)
                      else
                        Mongo::Connection.new(host, port, connection_opts)
                      end
    end

    def db
      @db ||= connection.db(database)
    end

    def grid
      @grid ||= Mongo::Grid.new(db)
    end

    private

    def ensure_authenticated!
      if username
        @authenticated ||= db.authenticate(username, password)
      end
    end

    def bson_id(uid)
      BSON::ObjectId.from_string(uid)
    end

    def extract_meta(grid_io)
      meta = grid_io.metadata
      meta = Utils.stringify_keys(marshal_b64_decode(meta)) if meta.is_a?(String) # Deprecated encoded meta
      meta.merge!('stored_at' => grid_io.upload_date)
      meta
    end

  end
end

