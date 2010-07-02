require 'carrierwave/orm/mongoid'

class Artifact
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  field :format
  field :description
  field :remote_url
  field :status
  
  mount_uploader :file, ArtifactUploader
  
  validates_presence_of :url
  validates_presence_of :validate_name
  validates_presence_of :validate_description
  
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
    
  # Metodos de la clase
  class << self
    # Buscar artefacto
    def search(query)
      where( :name => /.*#{query}.*/i )
    end
  end
end
