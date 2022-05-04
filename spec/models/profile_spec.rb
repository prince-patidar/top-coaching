# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
  
  let!(:user) { create(:user, email: 'abc@example.com') }
  let!(:profile) { create(:profile, user: user) }

  describe 'when profile is created' do 
    it 'should be valid with valid attributes' do
      expect(profile).to be_valid
    end

    it 'should not be valid without a name' do
      profile.name = nil
      expect(profile).not_to be_valid
    end

    it 'should not be valid without a father_name' do
      profile.father_name = nil
      expect(profile).not_to be_valid
    end

    it 'should not be valid with a age' do
      profile.age = nil
      expect(profile).not_to be_valid
    end

    it 'should not be valid with a dob' do
      profile.dob = nil
      expect(profile).not_to be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:user).without_validating_presence }
  end
end
