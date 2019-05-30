class DestinationsController < ApplicationController

    def index
        @destinations = Destination.all
    end

    def show
        destination_finder
    end

    def new
        Destination.new
    end

    def create
        @destination = Destination.new
        if @destination.save
            flash[:success] = "Destination saved"
            redirect_to destination_path(@destination)
        else
            redirect_to :new
        end
    end

    def edit
        destination_finder
    end

    def update
        destination_finder
        if @destination.update
            flash[:success] = "Destination updated"
            redirect_to destination_path(@destination)
        else
            redirect_to :edit
        end
    end

    def destroy
        destination_finder
        @destination.destroy
        flash[:success] = 'Delete success'
        redirect_to destinations_path
    end


    private

        def destination_finder
            @destination = Destination.find(params[:id])
        end

        def destination_params
            params.require(:destination).permit(:name)
        end
end