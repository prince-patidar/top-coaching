# frozen_string_literal: true

class NotificationRecipientCopy < ApplicationRecord
  belongs_to :user
  belongs_to :notification

  def change_status
    self.status = 'read'
    save
  end
end
