class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def individual_attendance
    @start_date = Date.current.prev_month.beginning_of_month
    @end_date = Date.current.prev_month.end_of_month
    @newatt = @employee.attendances.where(AttendanceDate: @start_date..@end_date).find_each do |att|
      @first_entry = att.action == 0 
      @first_exit = att.action = 1
      @second_entry = att.action = 2
      @second_exit = att.action =3 
      @date = Date.current.prev_month.beginning_of_month + 1
    end
    
  end
  helper_method :individual_attendance


  


  protected

  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email])
  end

  

end


# def individual_attendance
#   @employee = Employee.all
#   @date = Date.current.prev_month.beginning_of_month
#   @newatt = @employee.attendances.where(AttendanceDate: @date).find_each do |att|
#     @first_entry = attendance.action = 0 
#     @first_exit = attendance.action = 1
#     @second_entry = attendance.atcion = 2
#     @second_entry = attendance.action =3
#   end
  
# end
