class AddPublishStatusToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :publish_status, :boolean
  end

  def self.down
    remove_column :posts, :publish_status
  end
end
