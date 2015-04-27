class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path
    else
      flash[:errors] = @user.errors.full_message(", ").join
      render :new
    end
  end

  def show


  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password,
      :passord_confirmation)
  end
end
