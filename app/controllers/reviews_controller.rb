class ReviewsController < ApplicationController
  
    def index
      @reviews = Review.all
    end
    def new
      @book = Book.find(params[:book_id])
      @review = @book.reviews.new
    end
  

    def show
      @review = Review.find(params[:id])
    end
  
    def edit 

      @review = Review.find(params[:id])
    end
    def update
         @review = Review.find(params[:id])
         @book = @review.book
         if @review.update(review_params)
           redirect_to @book, notice: 'Review was successfully updated'
         else
           render :edit
           end
         end

  
      def destroy 
        @review = Review.find(params[:id])
        @book = @review.book
        @review.destroy
       
        redirect_to book_path(@book) , notice: 'Review was successfully deleted'
      end
  

  
    def create
      @book = Book.find(params[:book_id])
      @review = @book.reviews.create(review_params)
      @review.user = current_user
      if @review.save
        redirect_to book_path(@book)
      else
        render :new
      
      end
      
    end
  
    private
      def review_params
        params.require(:review).permit(:ranking, :testo)
      end
  end
  

