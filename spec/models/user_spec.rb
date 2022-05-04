# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
   
  let!(:user) { create(:user, email: 'abc@example.com', password: '1233454657') }
  describe 'when user is created' do

    it 'should be valid with valid attributes' do
      expect(user).to be_valid
    end
    it 'should not be valid without a email' do
      user.email = nil
      expect(user).not_to be_valid
    end
    it 'should not be valid without a password' do
      user.password = nil
      expect(user.password).to eql nil
    end
    it 'should not be valid with a password length short then 6' do
      user.password = '12345'
      expect(user).not_to be_valid
    end
  end
end
