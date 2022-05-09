# frozen_string_literal: true

ActiveAdmin.register UserGrade do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :grade_id

  form do |f|
    f.inputs 'User' do
      f.input :user_id, as: :select, collection: User.all.map { |u|
                                                   [u.email, u.id]
                                                 }.compact
    end
    f.inputs 'Grade' do
      f.input :grade_id, as: :select, collection: Grade.all.map { |g|
                                                    [g.class_name, g.id]
                                                  }.compact
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :grade_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
