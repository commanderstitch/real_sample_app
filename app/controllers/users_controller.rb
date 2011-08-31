class UsersController < ApplicationController

  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy

  def index
    @users = User.paginate(:page => params[:page])
    @title = "All users"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @user = User.new
    @title = "Sign up"
  end

  def create
    @user = User.new(params[:user])
   if @user.save
     sign_in @user
     flash[:success] = "Welcome to the Sample Application, now APPLY IT!"
     redirect_to @user
   else
    @title = "Sign up"
    render 'new'
    end
  end

  def edit
    @title = "Edit User"
  end

  def update
    if @user.update_attributes(params[:user])
    flash[:success] =  "YourProfile has been UPDATED, feel the POWER!!"
    redirect_to @user
    else
     @title = "Edit User"
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed HAHAHAHAHA he's GONE history BYE BYE yes!! ahahaha!!'"
    redirect_to users_path
  end

  private

  def authenticate
    deny_access unless signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    user = User.find(params[:id])
    redirect_to(root_path) if !current_user.admin? || current_user?(user)
  end
end


