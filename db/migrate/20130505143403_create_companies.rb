class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, limit: 30, null: false
      t.integer :plan, null: false

      t.timestamps
    end
  end
end
