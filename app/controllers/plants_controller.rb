class PlantsController < ApplicationController
    def index
        render json: Plant.all
    end

    def show
        plant = Plant.find(params[:id])
        if plant
            render json: plant
        else
            render json: {error: "Plant not found"}, status: :not_found
        end
    end

    def create
        plant = Plant.create(new_plant)
        render json: plant, status: :created
    end


    private

    def new_plant
        params.permit(:name, :image, :price)
    end

end