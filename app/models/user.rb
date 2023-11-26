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
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_person_name
  has_and_belongs_to_many :hobbies, inverse_of: :user
  validates :city, presence: true

  # Fetches users who share at least one hobby with the current user.
  #
  # @return [ActiveRecord::Relation] A distinct collection of users with shared hobbies.
  def users_with_shared_hobbies
    User.joins(:hobbies)
        .where(hobbies: { id: hobby_ids })
        .where.not(id:)
        .distinct
  end

  # Fetches users from the same city as the current user.
  #
  # @return [ActiveRecord::Relation] A collection of users from the same city.
  def users_from_same_city
    User.where(city:)
        .where.not(id:)
  end
end
