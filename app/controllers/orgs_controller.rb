class OrgsController < ApplicationController
  def show
  	@user = User.find(session[:id])
  	@orgs = Org.all
  	@group = Group.where(org_id: params[:id], user_id: session[:id]) 
  end

  def create
  	@user = User.find(session[:id])
  	params[:org][:creator] = @user.email
  	@org = Org.new(org_params)
  	if @org.save
	  	data={
	  		user_id: session[:id],
	  		org_id: @org.id 
	  	}
	  	Group.create(data)
  		redirect_to '/show'
  	else
  		flash[:new_org] = 'Organization not created; name and/or des too short'
  		redirect_to '/show'
  	end
  end

  def delete
  	Org.destroy(params[:id])
  	redirect_to '/show'
  end

  def org_params
  	params.require(:org).permit(:name, :description, :creator)
  end
end
