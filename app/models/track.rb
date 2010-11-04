class Track < ActiveRecord::Base

  belongs_to :album
  has_one :artist, :through => :album

  validates_uniqueness_of :name, :scope => :album_id

  scope :like, lambda { |query|
    select('tracks.*, artists.name as artist_name').
    joins('join albums on albums.id = tracks.album_id').
    joins('join artists on artists.id = albums.artist_id').
    where('tracks.name LIKE ?', query)
  }

  # Give the playtime in a d:dd format
  def pretty_runtime
    return nil if total_time.nil?
    t = total_time / 1000
    minutes = t / 60
    seconds = t - 60 * minutes
    sprintf '%d:%02d', minutes, seconds
  end

end
