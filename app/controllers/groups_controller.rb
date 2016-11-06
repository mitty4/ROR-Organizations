class GroupsController < ApplicationController

  def group
  	@org = Org.find(params[:id])
    @group = Group.where(org_id: params[:id], user_id: session[:id])
  end	

  def join
  	data={
	  		user_id: session[:id],
	  		org_id: params[:id]
	  	}
	Group.create(data)
	redirect_to '/show'
  end

  def leave
	@group = Group.where(org_id: params[:id], user_id: session[:id])  	
	@group.destroy_all
	redirect_to '/show'
  end
end
