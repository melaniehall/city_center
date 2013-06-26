class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table(:organizations) do |t|

        t.text :name
        t.text :bio
        t.text :mission
        t.text :city
        t.text :state
        t.integer :zip
        t.string :contact_email
        t.string :website
        t.string :twitter_handle
        t.string :facebook
        t.string :youtube
        t.string :logo

        t.timestamps
    end
  end
end
