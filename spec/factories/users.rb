# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  city                   :string           not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User#{n}" }
    sequence(:city) { |n| "City#{n}" }
    email { Faker::Internet.email }
    password { 'password123' }

    # Assuming you have a 'hobbies' association
    after(:create) do |user|
      user.hobbies << create(:hobby)
    end
  end
end
