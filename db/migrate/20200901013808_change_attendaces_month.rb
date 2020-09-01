class ChangeAttendacesMonth < ActiveRecord::Migration[5.2]
  def change
    change_column :attendances, :month, :datetime
  end
end
