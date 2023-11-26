class PagesController < ApplicationController
  def home
    redirect_to pages_dashboard_path if user_signed_in?
  end

  def dashboard
    redirect_to root_path unless user_signed_in?
  end

  # Get an example user with a matching hobby. Preferably from the same city.
  def find_hobby_partners
    matched_user = MatchMaker::HobbyMatch.call(current_user)

    respond_to do |format|
      format.json { render json: matched_user }
    end
  end
end
