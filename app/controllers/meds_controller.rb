class MedsController < ApplicationController
    def index
        @meds = Med.all
        render json: @meds
    end

    def show
        @med = Med.find(med_params[:id])
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
        @med = Med.find(med_params[:id])
        if @med.update
            render json: @med
        else
            render json: { error: "Unable to update medication." }
        end
    end

    def destroy
        @med = Med.find(med_params[:id])
        if @med.destroy
            render json: { message: "Successfully deleted medication." }
        else
            render json: { error: "Unable to delete medication." }
        end
    end

    private
    def med_params
        params.require(:med).permit(:name, :dosage)
    end
end
