class UsersController < ApplicationController
    before_action :set_user, only: [:update, :show, :destroy]
    before_action :authenticate_request, only: [:show, :update, :destroy]

    def index
        @users = User.all
        render json: @users
    end

    def show
        render json: UserBlueprint.render(@user, view: :normal)
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: UserBlueprint.render(user, view: :normal), status: :created 
        else
            render json: {error: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        if @user.update(user_params)
            render json: UserBlueprint.render(@user, view: :normal), status: :ok
        else
            render json: { error: "Unable to update user." }
        end
    end

    def destroy
        if @user.destroy
            render json: { message: "Successfully deleted user." }
        else
            render json: { error: "Unable to delete user." }
        end
    end

    private
    # def user_params
    #     params.require(:user).permit(:first_name, :last_name, :email, :password, :username)
    # end

    def user_params
        params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :username)
    end

    def set_user
        @user = User.find(params[:id])
    end
end

# 