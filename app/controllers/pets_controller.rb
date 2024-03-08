class PetsController < ApplicationController
    before_action :set_pet, only: [:show, :update, :destroy]
    before_action :authenticate_request


    def show
        render json: @pet
    end

    def create
        @pet = @current_user.pets.build(pet_params)
        if @pet.save
            render json: @pet, status: :created 
        else
            render json: {error: "Unable to create pet."}, status: :unprocessable_entity
        end
    end

    def update
        if @pet.update(pet_params)
            render json: @pet
        else
            render json: { error: "Unable to update pet." }
        end
    end

    def destroy
        if @pet.destroy
            render json: { message: "Successfully deleted pet." }
        else
            render json: { error: "Unable to delete pet." }
        end
    end

    private
    def pet_params
        params.require(:pet).permit(:name, :species)
    end

    def set_pet
        @pet = @current_user.pets.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Pet not found." }, status: :not_found
    end
end
