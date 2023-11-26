class PagesController < ApplicationController
  def home
    redirect_to pages_dashboard_path if user_signed_in?
  end

  def dashboard
    redirect_to root_path unless user_signed_in?
  end
end
