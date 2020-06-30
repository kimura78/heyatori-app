module Api
  module V1
    class RoomsController < ApiController
      before_action :authenticate_user!
      before_action :set_room, only: [ :update, :destroy ]

      def index
        rooms = Room.all
        render json: rooms
      end

      def create
        @room = Room.new(room_params)
        @room.user_id = current_user.id
        if @room.save
          render json: @room, status: :created
        else
          render json: { errors: @room.errors.full_messages }, status: :unprocessable_entity

        end
      end

      def update
        if @room.update_attributes(room_params)
          head :no_content
        else
          render json: { errors: @room.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @room.destroy
          head :no_content
        else
          render json: @room.errors, status: :unprocessable_entity
        end
      end
        
      private

        def set_room
          @room = Room.find(params[:id])
        end

        def room_params
          params.require(:room).permit(:name, :day, :user_id, :group_id)
        end

    end
  end
end