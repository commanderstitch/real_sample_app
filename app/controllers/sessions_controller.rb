class SessionsController < ApplicationController

  def new
    @title = "sign in"
  end

  def create
    user = User.authenticate(params[:session][:email],
                            params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination heheheh"
      render 'new'
    else
      sign_in user
      redirect_to user
    end
    render 'new'
  end

  def destroy

  end

end
