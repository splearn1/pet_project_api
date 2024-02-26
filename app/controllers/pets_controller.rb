class PetsController < ApplicationController
    def index
        @pets = Pet.all
        render json: @pets
    end

    def show
        @pet = Pet.find(pet_params[:id])
        render json: @pet
    end

    def create
        @pet = Pet.new(pet_params)
        if @pet.save
            render json: @pet, status: :created 
        else
            render json: {error: "Unable to create pet."}, status: :unprocessable_entity
        end
    end

    def update
        @pet = Pet.find(pet_params[:id])
        if @pet.update
            render json: @pet
        else
            render json: { error: "Unable to update pet." }
        end
    end

    def destroy
        @pet = Pet.find(pet_params[:id])
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
end
