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
  
  

  
      def destroy 
        @book = Book.find(params[:id])
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to book_path(@book) , notice: 'Review was successfully deleted'
      end
  

  
    def create
      @book = Book.find(params[:book_id])
      @review = @book.reviews.create(review_params)
      @review.user = current_user
      @review.save
      redirect_to book_path(@book)
    end
  
    private
      def review_params
        params.require(:review).permit(:ranking, :testo)
      end
  end
  

