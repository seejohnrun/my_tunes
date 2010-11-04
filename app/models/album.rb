class Album < ActiveRecord::Base

  belongs_to :artist
  has_many :tracks
  
  validates_uniqueness_of :name, :scope => :artist_id

  scope :like, lambda { |query|
    select('albums.*, artists.name as artist_name').
    joins('join artists on artists.id = albums.artist_id').
    where('albums.name LIKE ?', query)
  }

  def name
    self[:name].blank? ? '[unknown]' : self[:name]
  end

end
