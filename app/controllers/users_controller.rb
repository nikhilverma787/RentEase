class UsersController < ApplicationController
	layout 'unauthanticated'	
	def new
		@user = User.new
	end

	def create
	  existing_user = User.find_by(email: user_params[:email])
	  
	  if existing_user
	    flash[:notice] = 'You already have an account! Please log in.'
	    redirect_to login_path
	    return
	  end

	  @user = User.new(user_params)

	  if @user.save
	    flash[:notice] = 'Now you can log in here.'
	    redirect_to login_path
	  else
	    flash.now[:error] = 'Please fix the errors below.'
	    render :new, status: :unprocessable_entity
	  end
	end

	private

	def email_address
    params[:user][:email] rescue nil
  end

  def user_params
    params.require(:user).permit(
      :first_name, :last_name,:email,
      :password, :password_confirmation,
      :terms
    )
  end
end