require 'carrierwave/orm/mongoid'

class Artifact
  include Mongoid::Document
  include Mongoid::Timestamps
  
  before_validate :set_status
  
  field :name
  field :format
  field :description
  field :remote_url
  field :status
  
  mount_uploader :file, ArtifactUploader
  
  validates_presence_of :url
  validates_presence_of :name, :on => :update
  
  scope :complete, where(:status => 'complete')
  scope :incomplete, where(:status => 'incomplete')
  
  def url
    file.url || remote_url
  end
  
  def url=(u)
    self.remote_url = u
  end
  
  private
    def set_status
      case status
      when nil
        self.status = 'incomplete'
      when 'incomplete'
        self.status = 'complete'
      end
    end
  
    def set_incomplete_status
      self.status = 'incomplete'
    end
    
    def set_complete_status
      self.status = 'complete'
    end
    
    def complete?
      self.status == 'complete'
    end
    
    def incomplete?
      self.status == 'incomplete'
    end
  
  # Metodos de la clase
  class << self
    # Buscar artefacto
    def search(query)
      where( :name => /.*#{query}.*/i )
    end
  end
end
