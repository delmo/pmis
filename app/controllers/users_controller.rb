##########################################
#Controller for User of the system
#########################################
#
class UsersController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
 after_action :verify_authorized, except:  [:index, :show, :modify, :update]

  def index
   @users = User.all
  end

  def show
   @user = User.find(params[:id])
  end

  def modify
   @user = User.find(params[:id])
   @departments = Department.all
   @roles = User.roles
  end

  def update
   @user = User.find(params[:id])
   @departments = Department.all
   @roles = User.roles
    if @user.update(user_params)
      redirect_to users_index_path, notice: 'User was successfully updated.' 
    else
      render action: 'modify' 
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :role, :is_active, :department_id)
    end
end
