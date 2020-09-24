class Attendance < ApplicationRecord
  belongs_to :employee
  


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      month = DateTime.strptime(row["month"].gsub('/', '-'), '%d-%m-%y %H:%M')
      employee = Employee.find_by(rut: row["rut"])
      if employee.present?
        Attendance.create!(rut: row["rut"], month: month, action: row["action"], employee_id: employee.id, AttendanceDate: month.to_date)
      else
        Attendance.create!(rut: row["rut"], month: month, action: row["action"], employee_id: "nil", AttendanceDate: month.to_date)
      end
    end
  end
  
end
