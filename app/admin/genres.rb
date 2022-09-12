ActiveAdmin.register Genre do
  permit_params do
    permitted = [:title]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
end
