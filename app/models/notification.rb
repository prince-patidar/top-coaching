# frozen_string_literal: true

class Notification < ApplicationRecord
  has_many :notification_recipient_copies, dependent: :destroy

  after_save do
    NotificationCreatorJob.perform_now(self)
  end
end
