class Album < ActiveRecord::Base

  belongs_to :artist
  has_many :tracks
  
  validates_uniqueness_of :name, :scope => :artist_id

  def name
    self[:name].blank? ? '[unknown]' : self[:name]
  end

end
