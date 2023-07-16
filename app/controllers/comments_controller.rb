class CommentsController < ApplicationController

  def new
    @chapter = Chapter.find(params[:chapter_id])
    @comment = @chapter.comments.new
  end

  def edit 

    @comment = Comment.find(params[:id])
  end

    def create
        @chapter = Chapter.find(params[:chapter_id])
        #@user = current_user
        @comment = @chapter.comments.create(comment_params)
        #@comment2 = @user.comments.create(comment_params)
        @comment.user = current_user
        @comment.save
        redirect_to chapter_path(@chapter)
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
