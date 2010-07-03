require 'carrierwave/orm/mongoid'

class Artifact
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Tags
  
  field :name
  field :format
  field :description
  field :remote_url
  field :download_count, :default => 0, :type => Integer
  
  mount_uploader :file, ArtifactUploader
  
  validates_presence_of :url
  validates_presence_of :validate_name
  validates_presence_of :validate_description
  
  #scope :by_downloads, order_by(:download_count)
  scope :search, lambda { |query| where( :name => /.*#{query}.*/i ) }

  
  def mime 
  	
  	`file --mime -br "#{file.file.file}"`.strip if file.url
  end
  
  def validate_name
  	new_record? || name
  end
  
  def validate_description
  	new_record? || description
  end
  
  def url
    file.url || remote_url
  end
  
  def url=(u)
    self.remote_url = u
  end
      
  def download!
    Artifact.collection.update({'_id' => self.id}, {'$inc' => {'download_count' => 1}})
    self.download_count += 1
    URI.encode(self.url)
  end
  
  ## Funciones temporales
  def download_count
    attributes[:download_count] || 0
  end
  
  def tags
    attributes[:tags] || []
  end
end
