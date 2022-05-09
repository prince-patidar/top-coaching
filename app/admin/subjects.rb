# frozen_string_literal: true

ActiveAdmin.register Subject do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :subject_name, :user_id

  form do |f|
    f.inputs 'user' do
      f.input :user_id, as: :select, collection: User.all.map { |u|
                                                   [u.email, u.id] if u.has_role? :teacher
                                                 }.compact
      f.input :subject_name
    end
    f.actions
  end

  #
  # or
  #
  # permit_params do
  #   permitted = [:subject_name, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
