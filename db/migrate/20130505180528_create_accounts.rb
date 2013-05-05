class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :email, limit: 256
      t.string :password_hash, limit: 64
      t.string :salt, limit: 32
      t.string :first_name
      t.string :last_name
      t.integer :gender, default: 0
      t.integer :group, default: 0

      t.timestamps
    end
  end
end
