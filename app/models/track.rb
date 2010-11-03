class Track < ActiveRecord::Base

  belongs_to :album

  validates_uniqueness_of :name, :scope => :album_id

end
