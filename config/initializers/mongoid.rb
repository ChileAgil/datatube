Mongoid.configure do |config|
  name = nil
  
  case Rails.env
  when 'test'
    name = "datatube_test"  
  when 'production'
    name = "datatube_production"
  else
    name = "datatube_development"
  end
  
  config.master = Mongo::Connection.new.db(name)
  # config.slaves = [
  #   Mongo::Connection.new(host, 27018, :slave_ok => true).db(name),
  #   Mongo::Connection.new(host, 27019, :slave_ok => true).db(name)
  # ]
end
