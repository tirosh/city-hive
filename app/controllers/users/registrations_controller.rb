# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # Get an example user with a matching hobby. Preferably from the same city.
  def find_hobby_partners
    matched_user = MatchMaker::HobbyMatch.call(current_user)

    respond_to do |format|
      format.json { render json: matched_user }
    end
  end

  # Export profile of current_user as CSV
  def profile_export
    ProfileExportJob.perform_inline(current_user.id)
    flash[:notice] = 'Export job has been enqueued. You will be notified once it is complete.'
    redirect_to root_path
  end
end
