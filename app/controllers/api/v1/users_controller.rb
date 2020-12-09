class Api::V1::UsersController < ApplicationController
    before_action :find_user, only: [:show, :update, :destroy]
    def index
        @users = User.all
        render json: @users
    end

    def create
        @user = User.new(user_params)
        if @user.save
            UserNotifierMailer.send_signup_email(@user).deliver
        else
            render error: { error: 'unable to create User.'}, status: 400
        end
    end

private 

    def user_params
        params.permit(:username, :phone, :comment, :name)
    end

    def find_user
        @user = User.find(params[:id])
    end

end
