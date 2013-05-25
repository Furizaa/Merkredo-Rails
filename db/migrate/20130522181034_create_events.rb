class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :body, null: true
      t.datetime :dtbegin, null: false
      t.datetime :dtend, null: false
      t.integer :account_id, null: false
      t.string :token, limit: 64, null: false
      t.boolean :verified, default: false, null: false
      t.string :uid, null: false

      t.timestamps
    end
  end
end
