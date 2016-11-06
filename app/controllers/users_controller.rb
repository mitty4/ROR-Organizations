class UsersController < ApplicationController

  def login
  	 @user = User.find_by_email(params[:user][:email])
	if @user && @user.authenticate(params[:user][:password])
		session[:id] = @user.id
		redirect_to '/show'
	else
		flash[:login] = 'invalid combination'
		@user = nil
    	redirect_to '/'
	end
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:id] = @user.id
  		redirect_to '/show' and return
  	else
  		flash[:create] = @user.errors.full_messages
  		redirect_to '/' and return
  	end
  end

  def delete
    user = User.find(session[:id])
    User.destroy(session[:id])
    email = user[:email]

    org = Org.where(creator: email).all
  	org.destroy_all
  	redirect_to '/'
  end	

  def logout
  	session[:id] = nil
  	redirect_to '/'
  end

 private
 	def user_params
 		params.require(:user).permit(:given_name, :family_name, :email, :password)
 	end	

 	def update_params
    	params.require(:user).permit(:name, :alias, :email)
  	end
end
