class Track < ActiveRecord::Base

  belongs_to :album
  has_one :artist, :through => :album

  validates_uniqueness_of :name, :scope => :album_id

end
