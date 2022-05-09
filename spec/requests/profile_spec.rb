# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Profiles', type: :request do
  let!(:user) { create(:user, email: 'stuu@mu.com') }
  let!(:grade) { create(:grade) }
  let!(:user_grade) { create(:user_grade, user: user, grade: grade) }
  let!(:course) { create(:course, grade: grade)}
  let(:valid_attributes) do
    { user_id: user.id, name: 'Surendra', father_name: 'N. Panwar', age: 22, dob: Time.now }
  end

  let(:invalid_attributes) do
    { user_id: user.id, name: 'Surendra', father_name: 'N. Panwar', dob: Time.now }
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      sign_in user
      Profile.new
      get new_profile_url
      expect(response).to render_template(:new)
    end
  end
  describe 'GET /show' do
    it 'renders a successful response' do
      sign_in user
      profile = Profile.create valid_attributes
      get profile_url(profile)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Profile' do
        sign_in user
        expect do
          post profiles_url, params: { profile: valid_attributes }
        end.to change(Profile, :count).by(1)
      end
      it 'redirects to the profile' do
        sign_in user
        post profiles_url, params: { profile: valid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end
    context 'with invalid parameters' do
      it 'does not create a new Profile' do
        sign_in user
        expect do
          post profiles_url, params: { profile: invalid_attributes }
        end.to change(Profile, :count).by(0)
      end
      it "renders a successful response (i.e. to display the 'new' template)" do
        sign_in user
        post profiles_url, params: { profile: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      sign_in user
      profile = Profile.create valid_attributes
      get edit_profile_url(profile)
      expect(response).to be_successful
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { user_id: user.id, name: 'Surendra2', father_name: 'N. Panwar', age: 22, dob: Time.now }
      end

      it 'updates the requested profile' do
        sign_in user
        profile = Profile.create! valid_attributes
        patch profile_url(profile), params: { profile: new_attributes }
        profile.reload
        expect(response).to have_http_status(302)
      end

      it 'redirects to the profile' do
        sign_in user
        profile = Profile.create! valid_attributes
        patch profile_url(profile), params: { profile: new_attributes }
        profile.reload
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
