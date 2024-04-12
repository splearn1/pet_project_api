class PrescriptionsController < ApplicationController
    # before_action :set_prescription, only: [:show, :update, :destroy]

    def index
        @prescriptions = Prescription.all
        render json: @prescriptions
    end

    def show
        render json: @prescription
    end

    def create
        @prescription = Prescription.new(prescription_params)
        if @prescription.save
            render json: @prescription, status: :created 
        else
            render json: {error: "Unable to create prescription."}, status: :unprocessable_entity
        end
    end

    def update
        if @prescription.update
            render json: @prescription
        else
            render json: { error: "Unable to update prescription." }
        end
    end

    def destroy
        if @prescription.destroy
            render json: { message: "Successfully deleted prescription." }
        else
            render json: { error: "Unable to delete prescription." }
        end
    end

    private
    def prescription_params
        params.permit(:frequency, :duration, :date_prescribed)
    end

    def set_prescription
        @prescription = Prescription.find(params[:id])
    end
end
