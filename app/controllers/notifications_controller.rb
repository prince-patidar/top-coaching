# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(creator: current_user.email)
  end

  def new
    @notification = Notification.new
  end

  def create
    notification = Notification.new(notification_params)
    return redirect_to root_path if notification.save

    render :new, status: :unprocessable_entity
  end

  def destroy
    notification = Notification.find(params[:id])
    notification.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def notification_params
    params.require(:notification).permit(:creator, :title, :message, :notification_for_grade, :notification_for_user,
                                         :notification_for_role)
  end
end
