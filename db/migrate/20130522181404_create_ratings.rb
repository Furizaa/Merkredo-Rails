class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :attendee_id, null: false
      t.integer :event_id, null: false
      t.integer :roti, null: false
      t.text :shout, null: true
      t.string :token, limit: 64, null: false

      t.timestamps
    end
  end
end
