class Artist < ActiveRecord::Base

  validates_uniqueness_of :name  

  scope :not_removed, where('removed = ?', false)

  def self.mark_all_removed
    self.update_all('removed = 1')
  end

end
