# frozen_string_literal: true

ActiveAdmin.register Course do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :course_name, :grade_id
  form do |f|
    f.inputs 'Grade' do
      f.input :grade_id, as: :select, collection: Grade.all.map { |g|
                                                    [g.class_name, g.id]
                                                  }.compact
      f.input :course_name
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:course_name, :grade_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
