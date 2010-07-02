class Person
  include Mongoid::Document
  include Mongoid::Versioning
  include Mongoid::Timestamps
  
  field :first_name
  field :middle_initial
  field :last_name
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  def full_name
    [first_name, middle_initial, last_name].join(' ')
  end

  def login
  end
  
end
