# frozen_string_literal: true

class CreateUserGrades < ActiveRecord::Migration[6.1]
  def change
    create_table :user_grades do |t|
      t.references :user, null: false, foreign_key: true
      t.references :grade, null: false, foreign_key: true

      t.timestamps
    end
  end
end
