# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :father_name
      t.integer :age
      t.date :dob
      t.string :avatar

      t.timestamps
    end
  end
end
