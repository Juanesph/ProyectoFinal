class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.date :month
      t.string :rut
      t.integer :action
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
