class RegistrationsController < Devise::RegistrationsController
	#user registration update
	def create
		if resource_name == :user
			super
		else			
			build_resource(sign_up_params)
			render :new
		end
	end
	
	private

	def sign_up_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end