ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :content, :user_id, :frontend, :backend, :instruction, :front, :frontend_css, :javascript, :status
  #
  # or
  #
  permit_params do
    permitted = [:content, :user_id, :frontend, :backend, :instruction, :front, :frontend_css, :javascript, :status]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
