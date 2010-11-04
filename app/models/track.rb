class Track < ActiveRecord::Base

  belongs_to :album
  has_one :artist, :through => :album

  validates_uniqueness_of :name, :scope => :album_id

  # Give the playtime in a d:dd format
  def pretty_runtime
    return '0:00' if total_time.nil?
    t = total_time / 1000
    minutes = t / 60
    seconds = t - 60 * minutes
    sprintf '%d:%02d', minutes, seconds
  end

end
