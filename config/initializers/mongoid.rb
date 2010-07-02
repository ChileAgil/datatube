Mongoid.configure do |config|
  
  case Rails.env
  when 'test'
    name = "datatube_test"
  when 'development'
    name = "datatube_development"
  else
    name = "datatube_production"
  end
  
  config.master = Mongo::Connection.new.db(name)
  # config.slaves = [
  #   Mongo::Connection.new(host, 27018, :slave_ok => true).db(name),
  #   Mongo::Connection.new(host, 27019, :slave_ok => true).db(name)
  # ]
end
