class EmployeesController < ApplicationController
  before_action :set_company, only: [:create, :new, :index]
  def index
    @employees = Employee.all
    
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.company = Company.find(params[:company_id])
    
    respond_to do |format|
      if @employee.save
        format.html { redirect_to [@employee.company, @employees], notice: "El empleado fue guardado satisfactoriamente" }
      else
        format.html { render :new, notice: "El empleado debe tener un nombre" }
      end
    end
  end

  def update
    @employee = Employee.find(params[:id])
 
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def employee_params
      params.require(:employee).permit(:name, :rut, :position, :birthday, :phone, :start_date, :end_date)
    end

    def set_company
      @company = Company.find(params[:company_id])
    end
end
