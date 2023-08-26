class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_test_user, if: -> { Rails.env.test? }
  #validates :titolo, presence: true
  #validates :trama, presence: true, length: { minimum: 10 }

  def index
    @books = Book.all

   if params[:searchtitle]
    @search_term = params[:searchtitle]
    @books = @books.search_by_title(@search_term)
   end
   if params[:searchgenre]
    @search_term = params[:searchgenre]
    @books = @books.search_by_genre(@search_term)
   end
   if params[:searchtag]
    @search_term = params[:searchtag]
    @books = @books.search_by_tag(@search_term)
   end

  end
  def dichiarapubblicato
    @book = Book.find(params[:id])
    @book.stato = 'completato'
    @book.save
    redirect_to @book

  end
  def cambiaprivacy
    @book = Book.find(params[:id])
    if @book.visibility == 'visibile'
      @book.visibility = 'privato'
      @book.save
    else
      @book.visibility = 'visibile'
      @book.save
    end

    redirect_to @book

  end
  
  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = current_user.books.new
  end

  def edit 
    @book = current_user.books.find(params[:id])
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save



      redirect_to @book, notice: 'Book was successfully created'
    else
      render :errore
      end
  end

    def update
      @book = current_user.books.find(params[:id])
      if @book.update(book_params)
        redirect_to @book, notice: 'Book was successfully updated'
      else
        render :edit
        end
      end

      def destroy 
        @book = current_user.books.find(params[:id])
        #@book.users.clear
        @book.destroy
        redirect_to root_path, notice: 'Book was successfully deleted'
      end

      def ordina 
          @books = Book.order(:likes).reverse()
      end

        private

        def set_test_user
          @current_user = User.first
        end

        def book_params
          params.require(:book).permit(:titolo, :trama, :tag, :genere, :cover)
        end
      
  
end
