class Artist < ActiveRecord::Base

  has_many :albums
  has_many :tracks, :through => :album

  validates_uniqueness_of :name  

  def name
    self[:name].blank? ? '[unknown]' : self[:name]
  end

end
