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
    params.require(:attendance).permit(:month, :rut, :action, :employee_id, employees_attributes: [:id, :name])
  end

  def set_employees
    @employees = Employee.all
  end

end

