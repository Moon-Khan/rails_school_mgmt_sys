  class Users::RegistrationsController < Devise::RegistrationsController
      before_action :authenticate_user!
      before_action :configure_sign_up_params, only: [:create]

      def profile
        @user = current_user
      end

    
      def new
        super 
      end


      def create
        super do |resource|
          resource.role = params[:user][:role] if params[:user][:role].present?
          resource.save
        end
      end

    
      def update_password
        if current_user.update(password_params)
          bypass_sign_in(current_user) # Keeps user logged in
          redirect_to user_profile_path, notice: "Password updated successfully"
        else
          flash[:alert] = "Error updating password"
          render :profile
        end
      end
    
      def deactivate
        current_user.update(active: false) # Assuming `active` column for soft delete
        sign_out current_user
        redirect_to root_path, notice: "Account deactivated"
      end
    
      private
    
      def password_params
        params.require(:user).permit(:password, :password_confirmation)
      end


      def sign_up_params
          params.require(:user).permit(:email, :password, :password_confirmation, :role)
      end

      def account_update_params
          params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :role)
      end


      protected

      def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
      end
      
    end
    