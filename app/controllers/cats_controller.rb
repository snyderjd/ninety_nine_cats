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
        @cat = Cat.new
        render :new
    end

    def create
        # create a new cat from params and save it to the database
    end

    # def create
    #     @book = Book.new(book_params)
    
    #     if @book.save
    #       # show user the book show page
    #       redirect_to book_url(@book)
    #     else
    #       # show user the new book form
    #       render :new
    #     end
    #   end

    private

    def cat_params
        params.require(:cat).permit(:name, :sex, :color, :birth_date, :description)
    end

end