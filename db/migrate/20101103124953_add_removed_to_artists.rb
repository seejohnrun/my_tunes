class AddRemovedToArtists < ActiveRecord::Migration
  def self.up
    add_column :artists, :removed, :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :artists, :removed
  end
end
