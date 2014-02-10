class UserRegistrationsController < Devise::RegistrationsController
	
	def create
		# customized code begin
	    params[:user] ||= {}
	    params[:user][:user_type] ||= 'patient'

	    user_type = params[:user][:user_type]
	     params[:user].delete(:user_type)

	    build_resource(params[:user])

	    #render :text => build_resource(params[:user]).inspect and return false
	    
	    # crate a new child instance depending on the given user type
	    child_class = user_type.camelize.constantize
	    resource.accountable = child_class.new(params[child_class.to_s.underscore.to_sym])

	    # first check if child instance is valid
	    # cause if so and the parent instance is valid as well
	    # it's all being saved at once
	    valid = resource.valid?
	    valid = resource.accountable.valid? && valid
		
	    # customized code end

	    if valid && resource.save    # customized code
	      if resource.active_for_authentication?
	        set_flash_message :notice, :signed_up if is_navigational_format?
	        sign_in(resource_name, resource)
	        redirect_to root_url
	        #respond_with resource, :location => redirect_location(resource_name, resource)
	      else
	        set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
	        expire_session_data_after_sign_in!
	        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
	      end
	    else
	      clean_up_passwords(resource)
	      respond_with_navigational(resource) {
	      	params[:user][:user_type] = user_type 
	      	render :new # => params and return false
	      	#render_with_scope :new 
	      }
	    end
	end
end
