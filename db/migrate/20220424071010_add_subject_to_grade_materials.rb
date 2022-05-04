class AddSubjectToGradeMaterials < ActiveRecord::Migration[6.1]
  def change
    add_reference :grade_materials, :subject, null: true, foreign_key: true
  end
end
