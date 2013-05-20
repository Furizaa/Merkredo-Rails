class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, limit: 256
      t.boolean :active
      t.integer :gender, default: 0
      t.integer :company_id

      t.timestamps
    end
  end
end
