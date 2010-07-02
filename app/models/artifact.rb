class Artifact
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  field :format
  field :description
  field :url
  field :download_count, :default => 0, :type => Integer
  
  validates_presence_of :name
  
  #scope :by_downloads, order_by(:download_count)
  scope :search, lambda { |query| where( :name => /.*#{query}.*/i ) }
  
  def download!
    Artifact.collection.update({'_id' => self.id}, {'$inc' => {'download_count' => 1}})
    self.download_count ||=0
    self.download_count += 1
    URI.encode(self.url)
  end
end
