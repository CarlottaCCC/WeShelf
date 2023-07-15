class LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_like, only: [:destroy]
    
    before_action :find_chapter
    def find_like
        @like = @chapter.likes.find(params[:id])
    end
    def create

        if already_liked?


            flash[:notice] = "Non puoi mettere piu di un mi piace"

        else

            @chapter.likes.create(user_id: current_user.id)
        end
        redirect_to chapter_path(@chapter)
    end

    def destroy

        if !(already_liked?)
          flash[:notice] = "Cannot unlike"
        else
          @like.destroy
        end
        redirect_to chapter_path(@chapter)
    end
   

    private

    
    def already_liked?
        Like.where(user_id: current_user.id, chapter_id:
        params[:chapter_id]).exists?
    end

    def find_chapter
        @chapter = Chapter.find(params[:chapter_id])
    end
    
end
