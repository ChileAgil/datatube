require 'carrierwave/orm/mongoid'

class Artifact
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  field :format
  field :description
  field :url
  
  mount_uploader :file, ArtifactUploader
  
  validates_presence_of :name
  
  def url
    file.url || attributes['url']
  end
  
  # Metodos de la clase
  class << self
    # Buscar artefacto
    def search(query)
      where( :name => /.*#{query}.*/i )
    end
  end
end
