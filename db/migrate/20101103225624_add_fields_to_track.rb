class AddFieldsToTrack < ActiveRecord::Migration
  def self.up
    add_column :tracks, :total_time, :integer
    add_column :tracks, :location, :string
  end

  def self.down
    remove_column :tracks, :total_time
    remove_column :tracks, :location
  end
end
