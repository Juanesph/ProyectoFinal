class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)
  end

  def update
  end

  def destroy
  end

  private
    def employee_params
      params.require(:employee).permit(:name, :rut, :position, :birthday, :phone, :start_date, :end_date)
    end
end
