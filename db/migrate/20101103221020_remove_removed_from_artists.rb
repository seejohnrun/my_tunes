class RemoveRemovedFromArtists < ActiveRecord::Migration
  def self.up
    remove_column :artists, :removed
  end

  def self.down
    add_column :artists, :removed, :boolean, :default => false, :null => false
  end
end
