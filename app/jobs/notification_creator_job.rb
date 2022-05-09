# frozen_string_literal: true

class NotificationCreatorJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: false

  # rubocop:disable Metrics/AbcSize
  def perform(notification)
    if notification.notification_for_user
      create_notification_recipient_copies(notification.notification_for_user, notification)
    elsif notification.notification_for_role && notification.notification_for_grade
      User.all.each do |user|
        next unless (notification.notification_for_role == 'all' ||
            user.roles.first.name == notification.notification_for_role ||
            user.roles.first.name == notification.notification_for_role) &&
                    !user.grades.where(id: notification.notification_for_grade).empty?

        create_notification_recipient_copies(user.id, notification)
      end
    else
      User.all.each do |user|
        create_notification_recipient_copies(user.id, notification)
      end
    end
  end
  # rubocop:enable Metrics/AbcSize

  def create_notification_recipient_copies(user_id, notification)
    notification_recipient_copy = NotificationRecipientCopy.create(
      status: 'unread',
      user_id: user_id,
      notification_id: notification.id
    )
    ActionCable.server.broadcast(
      'notification_channel',
      {
        id: notification_recipient_copy.id,
        notification: notification,
        user_id: user_id
      }
    )
  end
end
