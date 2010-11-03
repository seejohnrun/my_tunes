class Artist < ActiveRecord::Base

  has_many :albums
  has_many :tracks, :through => :album

  validates_uniqueness_of :name  

end
