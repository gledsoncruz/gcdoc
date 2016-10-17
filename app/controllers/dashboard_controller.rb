class DashboardController < ApplicationController
  def index
    authorize User
  end
end
