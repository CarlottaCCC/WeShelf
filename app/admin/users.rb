ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :full_name, :uid, :avatar_url, :provider
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :full_name, :uid, :avatar_url, :provider]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :email, :admin, :username

  form do |f|
    #f.semantic_error:scale 
    f.inputs do
      f.input :username
      f.input :email
      f.input :admin
    end
    f.actions
  end

  index do 
    id_column 
    column :username 
    column :email  
    column :created_at
    column :ipdated_at
    column :full_name
    column :admin
    actions
  end
  
end
