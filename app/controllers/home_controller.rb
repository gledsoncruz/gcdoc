class HomeController < ApplicationController
	skip_before_filter :authenticate_user!
	layout 'main'
  def index
  end
end
