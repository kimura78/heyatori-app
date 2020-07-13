module Api
  module V1
    class VotesController < ApiController
      before_action :authenticate_user!

      def index
        votes = Vote.where(timetable_id: params[:id])
        render json: votes
      end

      def show
        if params[:id] == "0"
          votes = Vote.where(timetable_id: params[:timetable_id])
          votes = votes.where(user_id: current_user.id)
          if votes.empty?
            votes = "yet"
          end
          render json: votes
        else
          @vote = Vote.find(params[:id])
          if @vote.user_id == current_user.id
            @vote = "voter"
          end
          render json: @vote
        end
      end

      def create
        @vote = Vote.new(vote_params)
        @vote.user_id = current_user.id
        if @vote.save
          render json: @vote, status: :created
        else
          render json: { errors: @vote.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @vote = Vote.find(params[:id])
        if @vote.destroy
          head :no_content
        else
          render json: @vote.errors, status: :unprocessable_entity
        end
      end
        
      private

        def vote_params
          params.require(:vote).permit(:timetable_id, :user_id)
        end
    end
  end
end