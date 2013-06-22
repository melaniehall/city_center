class AddProfileAttributesToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :name, :text
    add_column :organizations, :bio, :text
    add_column :organizations, :mission, :text
    add_column :organizations, :city, :text
    add_column :organizations, :state, :text
    add_column :organizations, :zip, :integer
    add_column :organizations, :contact_email, :string
    add_column :organizations, :website, :string
    add_column :organizations, :twitter_handle, :string
    add_column :organizations, :facebook, :string
    add_column :organizations, :youtube, :string
    add_column :organizations, :logo, :string
  end
end
