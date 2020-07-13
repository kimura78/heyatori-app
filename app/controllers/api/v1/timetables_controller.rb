module Api
  module V1
    class TimetablesController < ApiController
      before_action :authenticate_user!
      before_action :set_timetable, only: [:show, :update, :destroy]

      def index
        @room = Room.find(params[:room_id])
        timetables = @room.timetables.order(:start_time)
        render json: timetables
      end

      def show
        if @timetable.user_id == current_user.id
          @timetable = "right"
        end
        render json: @timetable
      end

      def create
        @timetable = Timetable.new(timetable_params)
        @timetable.user_id = current_user.id
        @timetable.start_time.to_s
        @timetable.end_time.to_s

        if @timetable.save
          render json: @timetable, status: :created
        else
          render json: { errors: @timetable.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @timetable.update_attributes(timetable_params)
          head :no_content
        else
          render json: { errors: @timetable.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @timetable.destroy
          head :no_content
        else
          render json: @timetable.errors, status: :unprocessable_entity
        end
      end
        
      private

        def set_timetable
          @timetable = Timetable.find(params[:id])
        end

        def timetable_params
          params.require(:timetable).permit(:start_time, :end_time, :room_id, :group_id)
        end

    end
  end
end