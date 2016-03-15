class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:staff, :name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:staff, :name, :email, :password, :password_confirmation, :current_password)
  end

   protected

  

  def after_sign_up_path_for(resource)
    new_user_profile_path(current_user) # Or :prefix_to_your_route
  end
end