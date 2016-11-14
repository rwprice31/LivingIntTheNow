class RegistrationsController < Devise::RegistrationsController
  private
 def find_store_id(store_input)
   if Store.where(store_id: store_input).exists?
      @store = Store.find(store_input)
   else
      flash[:alert] = "Signup failed."
      render "new"
   end
 end


 def sign_up_params
<<<<<<< HEAD
   params.require(:user).permit(:firstName, :lastName, :phone, :position, :active, :admin, :email, :store_id, :password, :password_confirmation)
 end

 def account_update_params
   params.require(:user).permit(:firstName, :lastName, :phone, :position, :active, :admin, :email, :store_id, :password, :password_confirmation, :current_password)
=======
   params.require(:user).permit(:firstName, :lastName, :phone, :active, :store, :admin, :email, :password, :password_confirmation)
 end

 def account_update_params
   params.require(:user).permit(:firstName, :lastName, :phone, :active, :store, :admin, :email, :password, :password_confirmation, :current_password)
>>>>>>> signup fix start
 end

end
