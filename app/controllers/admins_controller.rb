class AdminsController < ApplicationController
  
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
      
      redirect_to root_path
    else
      render :new


    end
  end
end
