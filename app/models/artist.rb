class Artist < ActiveRecord::Base

  has_many :albums

  validates_uniqueness_of :name  

end
