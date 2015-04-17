# Finding Some Interesting Bits

So, one of my gems that I enjoy -- because it just works -- is Dragonfly.

The code in mongo_data_store has some really cool bits that are good to note:

## Elmer Fudd's Memorization

The memoized pattern (a lot like a singleton)

    @var ||= create_instance_of_var

Get the info the frst time. After that, return the same thing without the
need to go get it again. A few examples:

    @db ||= connection.db(database)
    @grid ||= Mongo::Grid.new(db)
    @authenticated ||= db.authenticate(username, password)

## Hating on long constructor arg lists?

Pass a hash!

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

