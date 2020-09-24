class AttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employees, only: [:show]

  def index
    @attendances = Attendance.all
    respond_to do |format|
      format.html
      format.csv {send_data @attendances.to_csv}
    end
  end

  def import
    Attendance.import(params[:file])
    redirect_to attendances_path, notice: "Asistencia importada."
  end

  def show
    @attendances = Attendance.all
    # worked_hours = " "
    
    # @attendances.each do |a|
    #   a.rut
    # end
  end

  def individual_attendance
    @employee = Employee.first
    @date = Date.current.prev_month.beginning_of_month
    @newatt = @employee.attendances.where(AttendanceDate: @date).find_each do |att|
      @first_entry = attendance.action = 0 
      @first_exit = attendance.action = 1
      @second_entry = attendance.atcion = 2
	    @second_entry = attendance.action =3
    end
    
  end
  helper_method :individual_attendance

  def new
  end

  def edit
  end

  def create
    
  end

  def update
  end

  def destroy
  end

  private

  def attendance_params
    params.require(:attendance).permit(:month, :rut, :action, :employee_id, :AttendanceDate, employees_attributes: [:id, :name])
  end

  def set_employees
    @employees = Employee.all
  end

end

