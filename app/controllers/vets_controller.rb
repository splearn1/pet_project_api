class VetsController < ApplicationController

    def show
        render json: @vet
    end

    def update
        if @vet.update(vet_params)
            render json: @vet, status: ok
        else
            render json: { error: "Unable to update veterinarian." }
        end
    end

    private
    def vet_params
        params.require(:vet).permit(:name, :email, :phone)
    end

    def set_vet
        @vet = Vet.find(params[:id])
    end
end
