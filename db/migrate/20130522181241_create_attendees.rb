class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :email, null: false

      t.timestamps
    end
  end
end
