# frozen_string_literal: true

class CreateGradeMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :grade_materials do |t|
      t.string :course_name
      t.string :material
      t.string :subject_name
      t.references :user, null: false, foreign_key: true
      t.references :grade, null: false, foreign_key: true

      t.timestamps
    end
  end
end
