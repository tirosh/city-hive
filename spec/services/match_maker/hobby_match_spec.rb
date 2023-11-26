require 'rails_helper'

RSpec.describe MatchMaker::HobbyMatch, type: :service do
  describe '#call' do
    let(:a_hobby) { create(:hobby) }
    let(:another_hobby) { create(:hobby) }

    let(:user_with_a_hobby ) { create(:user, city: 'a city', hobbies: [a_hobby]) }
    let(:user_without_hobbies) { create(:user, hobbies: []) }
    let(:user_no_matching_hobbies) { create(:user) }

    it 'finds a user with the same hobby in the same city' do
      user_with_same_hobby_and_city = create(:user, city: 'a city', hobbies: [a_hobby])
      user_with_same_hobby_in_another_city = create(:user, city: 'another city', hobbies: [a_hobby])

      matched_user = described_class.call(user_with_a_hobby)
      expect(matched_user).to eq(user_with_same_hobby_and_city)
      expect(matched_user).not_to eq(user_with_same_hobby_in_another_city)
    end

    it 'does not find a user with the same hobby in the same but in another city' do
      user_with_same_hobby_in_another_city = create(:user, city: 'another city', hobbies: [a_hobby])
      user_with_another_hobby_in_same_city = create(:user, city: 'a city', hobbies: [another_hobby])

      matched_user = described_class.call(user_with_a_hobby)
      expect(matched_user).to eq(user_with_same_hobby_in_another_city )
      expect(matched_user).not_to eq(user_with_another_hobby_in_same_city)
    end

    it 'does not find users with the same hobby at all' do
      matched_user = described_class.call(user_with_a_hobby)
      expect(matched_user).to be_nil
    end
  end
end

