class UsersController < ApplicationController
  def index
  	@per_page = 30
  	@last = (User.count.to_f / @per_page).ceil 
    @page = params[:page].to_i
    if @page <= 0
    	@page = 1
    end
    @users = User.by_karma.page(@page, @per_page)
  end
end
