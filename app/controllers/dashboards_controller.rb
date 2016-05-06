class DashboardsController < ApplicationController
  layout "admin-application"
  before_action :authenticate_admin!

  def show
    @questions = Question.all
  end
end
