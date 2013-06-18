class CreateEvents < ActiveRecord::Migration
  def change
    create_table(:events) do |t|

      t.text :name
      t.text :description
      t.date :scheduled_on
      t.time :starts_at
      t.time :ends_at

      t.timestamps
    end
  end
end
