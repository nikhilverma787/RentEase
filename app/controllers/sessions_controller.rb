class SessionsController < ApplicationController
	layout 'unauthanticated'	
	def new
	end

	def create
		@user = User.find_by(email: email_address, password: user_password)
		byebug
		if @user
			redirect_to user_path
		else
			flash[:notice] = 'Invalid Email and Password'
			render :new
		end
	end

	private

	def email_address
    params[:email] rescue nil
  end

  def user_password
    params[:password] rescue nil
  end
end