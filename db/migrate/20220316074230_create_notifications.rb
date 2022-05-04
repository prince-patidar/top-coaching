class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :creator
      t.text :title
      t.text :message
      t.string :notification_for_role
      t.integer :notification_for_grade
      t.integer :notification_for_user

      t.timestamps
    end
  end
end
