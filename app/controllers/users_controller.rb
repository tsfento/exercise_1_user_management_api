class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def index
        users = User.all

        render json: users, status: :ok
    end
    
    def show
        render json: @user, status: :ok
    end
    
    def create
        user = User.new(user_params)

        if user.save
            render json: user, status: :ok
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        if @user.update(user_params)
            render json: @user, status: :ok
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        if @user.destroy
            render json: nil, status: :ok
        else
            render @user.errors.full_messages, status: :ok
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:full_name, :email, :age)
    end
end
