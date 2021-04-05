# class TargetsController < ApplicationController
#   before_action :set_target, only: %i[show update destroy]

#   # GET /targets
#   # GET /targets.json
#   def index
#     @targets = Target.all
#   end

#   # GET /targets/1
#   # GET /targets/1.json
#   def show; end

#   # POST /targets
#   # POST /targets.json
#   def create
#     @target = Target.new(target_params)

#     if @target.save
#       render :show, status: :created, location: @target
#     else
#       render json: @target.errors, status: :unprocessable_entity
#     end
#   end

#   # PATCH/PUT /targets/1
#   # PATCH/PUT /targets/1.json
#   def update
#     if @target.update(target_params)
#       render :show, status: :ok, location: @target
#     else
#       render json: @target.errors, status: :unprocessable_entity
#     end
#   end

#   # DELETE /targets/1
#   # DELETE /targets/1.json
#   def destroy
#     @target.destroy
#   end

#   private

#   # Use callbacks to share common setup or constraints between actions.
#   def set_target
#     @target = Target.find(params[:id])
#   end

#   # Only allow a list of trusted parameters through.
#   def target_params
#     params.require(:target).permit(:user_id, :topic_id, :title, :address, :latitude,
#                                    :longitude, :radius)
#   end
# end
