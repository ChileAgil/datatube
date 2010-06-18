class Artifact
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Tags
  
  field :name
  field :format
  field :description
  field :url
  
  validates_presence_of :name
  
  # Metodos de la clase
  class << self
    # Buscar artefacto
    def search(query)
      where( :name => /.*#{query}.*/i )
    end
  end
end
