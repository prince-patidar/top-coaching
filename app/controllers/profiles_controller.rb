# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[show edit update]
  def new
    @profile = Profile.new
  end

  def show; end

  def create
    profile = current_user.build_profile(profile_params)
    return redirect_to root_path if profile.save

    render :new, status: :unprocessable_entity
  end

  def edit; end

  def update
    return redirect_to root_path if @profile.update(profile_params)

    render :edit, status: :unprocessable_entity
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :father_name, :dob, :avatar, :age)
  end

  def set_profile
    @profile = current_user.profile
  end
end
