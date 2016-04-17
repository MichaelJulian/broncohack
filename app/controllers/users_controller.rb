class UsersController < ApplicationController
  before_action :authenticate_user!  
  before_action :set_user, only: [:edit, :edit_profile, :profile, :update, :destroy]

  def index
    @users = User.where('id != ?', current_user.id)

    respond_to do |format|
      format.html
      format.js
    end

  end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def edit_profile
    @user = current_user
  end

  def update
    if @user.update(users_params)
      respond_to do |format|
        format.html { redirect_to users_path }
      end
    else
      redirect_to edit_user_path(@user)
    end
  end

  def friends
    @friends = current_user.friendships.where(state: "ACTIVE").map(&:friend) + current_user.inverse_friendships.where(state: "ACTIVE").map(&:user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:first_name, :last_name, :bio, :major, :year, :preference, goals: [], goal_ids: [])
  end

end
