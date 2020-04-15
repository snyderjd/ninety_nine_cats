class CatRentalRequestsController < ApplicationController

    # render the form for a new cat_rental_request
    def new
        @cats = Cat.all
        render :new
    end

    # save a new cat_rental_request to the database
    def create
        @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
        
        if @cat_rental_request.save
            redirect_to cat_url(@cat_rental_request.cat)
        else
            flash.now[:errors] = @cat_rental_request.errors.full_messages
            render :new
        end
    end

    def approve
        @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
        @cat_rental_request.approve!
        
        redirect_to cat_url(@cat_rental_request.cat)
    end

    def deny
        @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
        @cat_rental_request.deny!

        redirect_to cat_url(@cat_rental_request.cat)
    end

    private

    def cat_rental_request_params
        params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
    end

end