class DropSubjects < ActiveRecord::Migration[6.1]
  def change
    drop_table :subjects
  end
end
