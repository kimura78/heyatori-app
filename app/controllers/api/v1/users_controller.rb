module Api
  module V1
    class UsersController < ApiController
      before_action :authenticate_user!

      def index
        users = User.where(id: params[:id])
        render json: users
      end

      def show
        if params[:id] == "0"
          user = current_user
          render json: user
        else
          user = User.find(params[:id])
          render json: user
        end
      end

    end
  end
end