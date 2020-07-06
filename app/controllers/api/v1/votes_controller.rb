module Api
  module V1
    class VotesController < ApiController
      before_action :authenticate_user!
      before_action :set_vote, only: [ :update, :destroy]

      def index
        votes = Vote.where(timetable_id: params[:id])
        render json: votes
      end

      def show
        if params[:id] = 0
          votes = Vote.where(timetable_id: params[:timetable_id])
          votes = votes.where(user_id: current_user.id)
          if votes.empty?
            votes = "yet"
          end
          render json: votes
        else
          @vote = vote.find(params[:id])
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

      def update
        if @vote.update_attributes(vote_params)
          head :no_content
        else
          render json: { errors: @vote.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @vote.destroy
          head :no_content
        else
          render json: @vote.errors, status: :unprocessable_entity
        end
      end
        
      private

        def set_vote
          @vote = vote.find(params[:id])
        end

        def vote_params
          params.require(:vote).permit(:timetable_id, :user_id)
        end
    end
  end
end