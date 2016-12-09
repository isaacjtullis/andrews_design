class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.new_contact(@user).deliver
      flash[:notice] = 'Congrats! They will respond shortly'
      redirect_to root_path
    else
      flash[:notice] = 'There must have been an error!'
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email
    )
  end
end
