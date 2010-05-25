Mongoid.configure do |config|
  name = "datatube_development"
  config.master = Mongo::Connection.new.db(name)
  # config.slaves = [
  #   Mongo::Connection.new(host, 27018, :slave_ok => true).db(name),
  #   Mongo::Connection.new(host, 27019, :slave_ok => true).db(name)
  # ]
end
