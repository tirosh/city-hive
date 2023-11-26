# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # Get an example user with a matching hobby. Preferably from the same city.
  def find_hobby_partners
    matched_user = MatchMaker::HobbyMatch.call(current_user)

    respond_to do |format|
      format.json { render json: matched_user }
    end
  end
end
