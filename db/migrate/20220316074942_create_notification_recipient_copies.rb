class CreateNotificationRecipientCopies < ActiveRecord::Migration[6.1]
  def change
    create_table :notification_recipient_copies do |t|
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :notification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
