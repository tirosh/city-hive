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

class Hobby < ApplicationRecord
  has_and_belongs_to_many :users, inverse_of: :hobbies
  validates :name, presence: true, uniqueness: true
end
