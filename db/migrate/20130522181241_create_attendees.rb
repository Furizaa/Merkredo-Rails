class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :event_id, null: false
      t.string :email, null: false
      t.string :token, limit: 64, null: false

      t.timestamps
    end
  end
end
