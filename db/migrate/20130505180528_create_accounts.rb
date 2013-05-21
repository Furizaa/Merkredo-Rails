class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :email, limit: 256
      t.string :password_hash, limit: 64
      t.string :salt, limit: 32
      t.string :auth_token, limit: 32

      t.timestamps
    end
  end
end
