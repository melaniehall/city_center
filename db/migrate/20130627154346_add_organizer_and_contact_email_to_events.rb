class AddOrganizerAndContactEmailToEvents < ActiveRecord::Migration
  def change
    add_column :events, :organizer, :string
    add_column :events, :contact_email, :string
  end
end
