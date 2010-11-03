class RemoveSourceFromArtist < ActiveRecord::Migration
  def self.up
    remove_column :artists, :source
  end

  def self.down
    add_column :artists, :source, :string
  end
end
