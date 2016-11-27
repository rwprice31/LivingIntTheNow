class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)

     store = Store.last
     resource.store_id = store.id
     resource.email = store.email
     resource.save
     yield resource if block_given?
     if resource.persisted?
       if resource.active_for_authentication?
         set_flash_message! :notice, :signed_up
         sign_up(resource_name, resource)
         respond_with resource, location: after_sign_up_path_for(resource)
       else
         set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
         expire_data_after_sign_in!
         respond_with resource, location: after_inactive_sign_up_path_for(resource)
       end
     else
       clean_up_passwords resource
       set_minimum_password_length
       respond_with resource
     end
   end

  private

 def find_store_id(store_input)
     if Store.where(store_id: store_input).exists?
         @store = Store.find(store_input)
     else
         flash[:alert] = 'Signup failed.'
         render 'new'
     end
 end

 def sign_up_params
   params.require(:user).permit(:firstName, :lastName, :phone, :active, :store_id, :admin, :email, :password, :password_confirmation)
 end

 def account_update_params
   params.require(:user).permit(:firstName, :lastName, :phone, :active, :store_id, :admin, :email, :password, :password_confirmation, :current_password)

 end
end
