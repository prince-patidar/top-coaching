class ChangeCourseNameToTitle < ActiveRecord::Migration[6.1]
  def change
    rename_column :grade_materials, :course_name, :title
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
