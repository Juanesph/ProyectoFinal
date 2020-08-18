class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :rut
      t.string :position
      t.date :birthday
      t.integer :phone
      t.date :start_date
      t.date :end_date
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
