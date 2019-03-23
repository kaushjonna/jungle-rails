class SessionsController < ApplicationController
  def new
  end

  def create
    if user == User.authenticate_with_credentials(params[:email], params[:password])
      flash[:notice] = "Success!"
      session[:user_id] = user.id
      redirect_to '/'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(
                             :email,
                             :password
    )
  end
end
