ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :confirmed_at
    # column :current_sign_in_at
    # column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :confirmed_at
  # filter :current_sign_in_at
  # filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    # Users we created via admin should not send out confirmation mails
    def create
      @user = resource_class.new(*resource_params)
      @user.skip_confirmation!
      create!
    end
  end
end
