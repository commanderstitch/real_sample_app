class MicropostsController < ApplicationController

  before_filter :authenticate

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
       flash[:success] = "CONGRADULATIONS! you have successfully posted a post ON THE PAGE!!"
      redirect_to root_path
      else
      render 'pages/home'
      end
  end

  def destroy


  end
end