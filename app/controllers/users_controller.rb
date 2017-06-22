class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def update
    @user = User.find params[:id]
    @user.update! user_params
    render json: @user
  end

  def create
    @user = User.new user_params
    @user.save!
    render json: @user
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy!
    render json: @user
  end

  private
  def user_params
    params.require(:user).permit(:name, :first_name, :last_name, :phone_number, :group_id, :home_place_id, :work_place_id)
  end
end
