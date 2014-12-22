ActiveAdmin.register AdminUser do
menu false
  permit_params :email, :password, :password_confirmation
actions :all,:except => [:destroy,:index]
controller do
  def resource
    @admin_user = current_admin_user
  end
end

show do |admin|
  attributes_table do
    row :email
    row "Last Signed:" do
      admin.last_sign_in_at
    end
    row :created_at
  end
end
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
