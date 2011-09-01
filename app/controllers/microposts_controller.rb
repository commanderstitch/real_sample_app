class MicropostsController < ApplicationController

  before_filter :authenticate
  before_filter :authorized_user, :only => :destroy

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
       flash[:success] = "CONGRADULATIONS! you have successfully posted a post ON THE PAGE!!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
      end
  end

  def destroy
    @micropost.destroy
     flash[:success] = "Goodbye useless post, i hated you anyway."
    redirect_to root_path
  end
  private

  def authorized_user
    @micropost = Micropost.find(params[:id])
    redirect_to root_path unless current_user?(@micorpost.user)
  end
end