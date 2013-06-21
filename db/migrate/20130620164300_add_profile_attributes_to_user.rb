class AddProfileAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :text
    add_column :users, :bio, :text
    add_column :users, :city, :text
    add_column :users, :state, :text
    add_column :users, :website, :string
    add_column :users, :twitter_handle, :string
    add_column :users, :facebook, :string
  end
end
