class PrescriptionsController < ApplicationController
    def index
        @prescriptions = Prescription.all
        render json: @prescriptions
    end

    def show
        @prescription = Prescription.find(prescription_params[:id])
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
        @prescription = Prescription.find(prescription_params[:id])
        if @prescription.update
            render json: @prescription
        else
            render json: { error: "Unable to update prescription." }
        end
    end

    def destroy
        @prescription = Prescription.find(prescription_params[:id])
        if @prescription.destroy
            render json: { message: "Successfully deleted prescription." }
        else
            render json: { error: "Unable to delete prescription." }
        end
    end

    private
    def prescription_params
        params.require(:prescription).permit(:frequency, :duration, :date_prescribed)
    end
end
