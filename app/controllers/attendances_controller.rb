class AttendancesController < ApplicationController
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
end
