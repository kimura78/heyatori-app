module Api
  module V1
    class InvitesController < ApiController
      before_action :authenticate_user!
      before_action :set_invite, only: [:update, :destroy]

      def index
        invites = Invite.where(group_id: params[:id])
        render json: invites
      end

      def show
        if params[:id] = 0
          invites = Invite.where(user_id: current_user.id)
          if invites.empty?
            invites = "yet"
          end
          render json: invites
        else
          @invite = Invite.find(params[:id])
          render json: @invite
        end
      end

      def create 
        @invite = Invite.new(invite_params)
        @invite.user_id = current_user.id
        if @invite.save
          render json: @invite, status: :created
        else
          render json: { errors: @invite.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @invite.update_attributes(invite_params)
          head :no_content
        else
          render json: { errors: @invite.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @invite.destroy
          head :no_content
        else
          render json: @invite.errors, status: :unprocessable_entity
        end
      end
        
      private

        def set_invite
          @invite = Invite.find(params[:id])
        end

        def invite_params
          params.require(:invite).permit(:user_id, :group_id)
        end
    end
  end
end