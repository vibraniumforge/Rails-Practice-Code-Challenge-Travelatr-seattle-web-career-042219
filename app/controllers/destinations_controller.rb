class DestinationsController < ApplicationController

    def index
        @destinations = Destination.all
    end

    def show
        destination_finder
    end

    def new
        @destination  = Destination.new
    end

    def create
        @destination = Destination.new(destination_params)
        if @destination.save
            flash[:success] = "Destination saved"
            redirect_to destination_path(@destination)
        else
            flash[:error] = 'Destination did not save'
            render :new
        end
    end

    def edit
        destination_finder
    end

    def update
        destination_finder
        if @destination.update(destination_params)
            flash[:success] = "Destination updated"
            redirect_to destination_path(@destination)
        else
            flash[:error] = 'Destination did not update'
            render :edit
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
            params.require(:destination).permit(:name, :country)
        end
end