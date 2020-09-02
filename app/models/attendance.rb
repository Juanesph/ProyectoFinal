class Attendance < ApplicationRecord
  belongs_to :employee, optional: true
  


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      month = DateTime.strptime(row["month"].gsub('/', '-'), '%d-%m-%y %H:%M')
      Attendance.create!(rut: row["rut"], month: month, action: row["action"])
    end
  end
  
end
