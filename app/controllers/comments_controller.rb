class CommentsController < ApplicationController

  def new
    @chapter = Chapter.find(params[:chapter_id])
    @comment = @chapter.comments.new
  end

  def edit 

    @comment = Comment.find(params[:id])
  end
  def update
    @comment = Comment.find(params[:id])
    @chapter = @comment.chapter
    if @comment.update(comment_params)
      redirect_to @chapter, notice: 'Review was successfully updated'
    else
      render :edit
      end
    end


    def create
        @chapter = Chapter.find(params[:chapter_id])
        #@user = current_user
        @comment = @chapter.comments.create(comment_params)
        #@comment2 = @user.comments.create(comment_params)
        @comment.user = current_user
        if @comment.save
          redirect_to chapter_path(@chapter)
        else
          render :new

        end
      end

      def destroy 
        @comment = Comment.find(params[:id])
        @chapter = @comment.chapter
        @comment.destroy
        redirect_to chapter_path(@chapter), notice: 'Book was successfully deleted'
      end
    
      private
        def comment_params
          params.require(:comment).permit(:testo)
        end
    
end
