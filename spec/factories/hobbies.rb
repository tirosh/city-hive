# == Schema Information
#
# Table name: hobbies
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :hobby do
    sequence(:name) { |n| "Hobby#{n}" }
  end
end
