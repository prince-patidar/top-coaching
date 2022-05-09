# frozen_string_literal: true

ActiveAdmin.register Notification do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :creator, :title, :message, :notification_for_role, :notification_for_grade, :notification_for_user
  form do |f|
    f.inputs 'Notification Details' do
      f.input :creator
      f.input :title
      f.input :message
    end
    f.inputs 'For Single User' do
      f.input :notification_for_user, as: :select, collection: User.all.map { |u|
                                                                 [u.email, u.id]
                                                               }.compact
    end
    f.inputs 'For Many Users' do
      f.input :notification_for_role, as: :select, collection: %i[teacher student all]
      f.input :notification_for_grade, as: :select, collection: Grade.all.map { |g|
                                                                  [g.class_name, g.id]
                                                                }.compact
    end
    f.inputs 'For All User' do
      f.input :all_user, as: :check_boxes
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:creator, :title, :message, :notification_for_role, :notification_for_grade, :notification_for_user]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
