class AddGenreToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :genre, :string
  end

  def self.down
    remove_column :posts, :genre
  end
end
