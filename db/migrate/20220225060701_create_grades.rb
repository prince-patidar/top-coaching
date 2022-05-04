# frozen_string_literal: true

class CreateGrades < ActiveRecord::Migration[6.1]
  def change
    create_table :grades do |t|
      t.string :class_name

      t.timestamps
    end
  end
end
