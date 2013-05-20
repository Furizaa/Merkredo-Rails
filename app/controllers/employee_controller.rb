class EmployeeController < ApplicationController

  before_filter :ensure_logged_in

  def index
    employees = Employee.find_all_by_company_id(current_company_id)
    render json: {
        success: true,
        employees: employees
    }
  end

  def create
    requires_parameters :email, :first_name, :last_name
    employee = Employee.new_from_params(params)
    if employee.save
      return render json: { success: true }
    end
    render json: {
        success: false,
        message: "#{errors}"
    }
  rescue ActiveRecord::StatementInvalid
    render json: { success: false }
  end

  def update
    requires_parameters :id
    employee = Employee.find(params[:id])
    unless employee
      return render json: {
          success: false,
          message: I18n.t(:'employee.not_found', id: params[:id])
      }
    end
    employee.first_name = params[:first_name] if params[:first_name]
    employee.last_name  = params[:last_name] if params[:last_name]
    employee.email      = params[:email] if params[:email]
    if employee.save
      return render json: { success: true }
    end
    render json: {
        success: false,
        message: "#{errors}"
    }
  rescue ActiveRecord::StatementInvalid
    render json: { success: false }
  end

end
