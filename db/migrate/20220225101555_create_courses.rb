# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.text :course_name
      t.references :grade, null: false, foreign_key: true

      t.timestamps
    end
  end
end
