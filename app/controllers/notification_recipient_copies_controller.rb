# frozen_string_literal: true

class NotificationRecipientCopiesController < ApplicationController
  def show
    if Notification.where(id: params[:id]).empty?
      redirect_to root_path, status: :see_other
      return
    end
    @notification = Notification.find(params[:id])

    notification_recipient_copy = current_user.notification_recipient_copies.find_by(notification_id: @notification.id)
    notification_recipient_copy.change_status
  end

  def destroy
    if NotificationRecipientCopy.where(id: params[:id]).empty?
      redirect_to root_path, status: :see_other
      return
    end
    notification_recipient_copy = NotificationRecipientCopy.find(params[:id])
    notification_recipient_copy.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def notification_recipient_copy_params
    params.require(:notification_recipient_copy).permit(:creator, :title, :message, :notification_for_grade,
                                                        :notification_for_user, :notification_for_role)
  end
end
