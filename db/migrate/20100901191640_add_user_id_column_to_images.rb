class AddUserIdColumnToImages < ActiveRecord::Migration
  def self.up
    add_column :images, :user_id, :integer, :options => 
      "CONSTRAINT fk_user_images REFERENCES users(id)"
  end

  def self.down
    remove_column :images, :user_id
  end
end
