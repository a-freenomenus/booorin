class AddImagesCountToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :images_count, :integer, :default => 0
  end

  def self.down
    remove_column :users, :images_count
  end
end
