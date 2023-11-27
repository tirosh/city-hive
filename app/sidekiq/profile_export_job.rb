require 'csv'

class ProfileExportJob
  include Sidekiq::Job

  def perform(current_user_id)
    user = User.find current_user_id

    CSV.open("user_profile_#{user.id}.csv", 'w') do |csv|
      csv << ['First Name', 'Last Name', 'Email', 'City', 'Hobbies']
      csv << [user.first_name, user.last_name, user.email, user.city, user.hobbies.pluck(:name).join(' | ')]
    end
  end
end
