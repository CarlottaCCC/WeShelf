class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all
  end
  def new
    @book = Book.find(params[:book_id])
    @chapter = @book.chapters.new
  end

  def edit 

    @chapter = Chapter.find(params[:id])
  end
  def show
    @chapter = Chapter.find(params[:id])
  end

  def create
    @book = Book.find(params[:book_id])
    @chapter = @book.chapters.create(chapter_params)
    redirect_to book_path(@book)
  
  end

  def update
 #   @book = Book.find(params[:book_id])
   # @chapter =
  #  @chapter = @chapter.update(chapter_params)
 #   redirect_to book_path(@book)
 # end
    @chapter = Chapter.find(params[:id])
    if @chapter.update(chapter_params)
      redirect_to @chapter, notice: 'Book was successfully updated'
    else
      render :edit
      end
    end

    def destroy 
      @chapter = Chapter.find(params[:id])
      @chapter.destroy
      redirect_to root_path, notice: 'Book was successfully deleted'
    end

  private
    def chapter_params
      params.require(:chapter).permit(:titolo, :testo)
    end
end
