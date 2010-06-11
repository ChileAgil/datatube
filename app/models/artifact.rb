class Artifact
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  field :format
  
  validates_presence_of :name
end
