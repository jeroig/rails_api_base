module Api
  module V1
    class TargetsController < Api::V1::ApiController
      before_action :set_target, only: %i[show destroy linked]

      def linked
        authorize @target, :linked?
        @targets = @target.linked_targets
        render :index
      end

      # GET /targets
      # GET /targets.json
      def index
        @targets = policy_scope(Target)
      end

      # GET /targets/1
      # GET /targets/1.json
      def show
        authorize @target, :show?
      end

      # POST /targets
      # POST /targets.json
      def create
        @target = Target.new(target_params)
        authorize @target, :create?
        if @target.save
          render :show, status: :created
        else
          render json: @target.errors, status: :unprocessable_entity
        end
      end

      # DELETE /targets/1.json
      def destroy
        authorize @target, :destroy?
        @target.destroy!
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_target
        @target = policy_scope(Target).find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def target_params
        params.require(:target).permit(:user_id, :topic_id, :title, :address, :latitude,
                                       :longitude, :radius)
      end
    end
  end
end
