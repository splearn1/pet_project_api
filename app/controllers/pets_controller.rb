class PetsController < ApplicationController
    # before_action :set_pet, only: [:show, :update, :destroy]
    before_action :authenticate_request


    def show
        @pet = Pet.find(params[:id])
        render json: @pet, status: :ok
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
        @pet = Pet.find(params[:id])
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
        params.permit(:name, :species)
    end

    def set_pet
        if @current_user
          @pet = @current_user.pets.find_by(id: params[:id])
          render json: { error: "Pet not found." }, status: :not_found unless @pet
        else
          render json: { error: "Unauthorized: No current user." }, status: :unauthorized
        end
      end
end
