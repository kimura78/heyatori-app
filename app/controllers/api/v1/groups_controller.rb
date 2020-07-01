module Api
  module V1
    class GroupsController < ApiController
      before_action :authenticate_user!
      before_action :set_group, only: [:show, :update, :destroy]


      def index
        # groups = Group.where(user_id: current_user.id)
        groups = Group.all
        render json: groups
      end

      def show
        render json: @group
      end

      def create
        @group = Group.new(group_params)
        @group.user_id = current_user.id
        if @group.save
          @invite = Invite.new
          @invite.user_id = current_user.id
          @invite.group_id = @group.id
          @invite.save
          render json: @group, status: :created
        else
          render json: { errors: @group.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @group.update_attributes(group_params)
          head :no_content
        else
          render json: { errors: @group.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @group.destroy
          head :no_content
        else
          render json: @group.errors, status: :unprocessable_entity
        end
      end

      private

        def set_group
          @group = Group.find(params[:id])
        end

        def group_params
          params.require(:group).permit(:name, :user_id)
        end
    end
  end
end 