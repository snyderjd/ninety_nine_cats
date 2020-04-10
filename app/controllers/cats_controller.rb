class CatsController < ApplicationController
    def index
        @cats = Cat.all()
        render :index
    end

    def show
        @cat = Cat.find_by(id: params[:id])

        if @cat
            render :show
        else
            redirect_to cats_url
        end
    end

    def new
        @cat = Cat.new # builds blank cat to send to the view
        render :new
    end

    def create
        # create a new cat from params and save it to the database
        @cat = Cat.new(cat_params)

        if @cat.save
            #redirect user to the cat
            redirect_to cat_url(@cat)
        else
            #show user the new cat form
            render :new
        end
    end

    # finds the cat by id in params and renders the edit form
    def edit
        @cat = Cat.find_by(id: params[:id])
        render :edit
    end

    # takes in the values from the edit form and updates the cat
    def update
        @cat = Cat.find_by(id: params[:id])

        if @cat.update_attributes(cat_params)
            redirect_to cat_url(@cat)
        else
            render :edit
        end
    end

    # def update
    #     @book = Book.find_by(id: params[:id])
    
    #     if @book.update_attributes(book_params)
    #       redirect_to book_url(@book)
    #     else
    #       render :edit
    #     end
    #   end

    private

    def cat_params
        params.require(:cat).permit(:name, :sex, :color, :birth_date, :description)
    end

end