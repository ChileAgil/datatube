class Artifact
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  field :format
  field :description
  
  validates_presence_of :name
  
  def self.search(query)
    where( :name => /.*#{query}.*/i )
  end
end
