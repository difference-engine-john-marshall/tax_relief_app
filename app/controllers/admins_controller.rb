class AdminsController < ApplicationController
  layout "admin-application"
  # before_action :authenticate_admin!
  before_action :authenticate_superadmin!
  

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(
      email: params[:email],
      password: "defaulty",
      password_confirmation: "defaulty"  
    )

    if @admin.save
      email = params[:email]
      AdminNewMailer.admin_new(email).deliver_now
      flash[:success] = "Message sent"
      redirect_to '/dashboard'
    else
      redirect_to '/dashboard/admins/new'
    end
  end

  def edit
    @admins = Admin.all
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy  

    flash[:success] = "Admin removed"
    redirect_to '/dashboard'
  end
end

private

  def authenticate_superadmin!
      unless Admin.find_by(id: current_admin.id).superadmin
        redirect_to "/dashboard"
      end
  end