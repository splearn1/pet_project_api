class MedsController < ApplicationController
    # before_action :set_med, only: [:show, :update, :destroy]

    def index
        @meds = Med.all
        render json: @meds
    end

    def show
        render json: @med
    end

    def create
        @med = Med.new(med_params)
        if @med.save
            render json: @med, status: :created 
        else
            render json: {error: "Unable to create medication."}, status: :unprocessable_entity
        end
    end

    def update
        if @med.update
            render json: @med
        else
            render json: { error: "Unable to update medication." }
        end
    end

    def destroy
        if @med.destroy
            render json: { message: "Successfully deleted medication." }
        else
            render json: { error: "Unable to delete medication." }
        end
    end

    private
    def med_params
        params.permit(:name, :dosage)
    end

    def set_med
        @med = Med.find(params[:id])
    end
end
