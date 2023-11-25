# Module for matchmaking services for finding and pairing users based on specific criteria.
module MatchMaker
  # Service class responsible for finding a user with matching hobbies for the given user.
  # The primary goal is to locate a matching user within the same city or other locations based on shared hobbies.
  #
  # Example Usage:
  #   match_service = MatchMaker::HobbyMatch.call(current_user)
  #   matched_user = match_service.call
  #
  # If a matching user is found, it is returned; otherwise, nil is returned.
  class HobbyMatch < ApplicationService
    # Initializes a new instance of HobbyMatch with the specified user.
    #
    # @param user [User] The user for whom a matching user is to be found.
    def initialize(user)
      @user = user
    end

    # Attempts to find a matching user based on hobbies, prioritizing the same city and then other locations.
    #
    # @return [User, nil] The matched user or nil if no suitable match is found.
    def call
      find_matching_user_in_city || find_matching_user_in_other_locations
    end

    private

    # Finds a matching user within the same city based on shared hobbies.
    #
    # @return [User, nil] The matching user in the same city or nil if not found.
    def find_matching_user_in_city
      city_users = User.where(city: @user.city).where.not(id: @user.id)
      find_user_with_matching_hobbies(city_users)
    end

    # Finds a matching user in other locations based on shared hobbies.
    #
    # @return [User, nil] The matching user in other locations or nil if not found.
    def find_matching_user_in_other_locations
      all_users = User.where.not(city: @user.city).where.not(id: @user.id)
      find_user_with_matching_hobbies(all_users)
    end

    # Helper method to find a user with matching hobbies from a collection of users.
    #
    # @param users [ActiveRecord::Relation] The collection of users to search.
    # @return [User, nil] The matching user or nil if not found.
    def find_user_with_matching_hobbies(users)
      users_with_matching_hobbies = users.select do |user|
        (user.hobbies & @user.hobbies).any?
      end

      users_with_matching_hobbies.sample
    end
  end
end
