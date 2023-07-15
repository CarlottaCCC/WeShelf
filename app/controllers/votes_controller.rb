class VotesController < ApplicationController
    def create

        chapter = Chapter.find(params[:id])
        chapter.liked_by current_user 
        redirect_to chapter_path, notice: "You upvoted this chapter!"

    end

    def destroy

        chapter = Chapter.find(params[:id])
        chapter.unliked_by current_user 
        redirect_to chapter_path, notice: "You unvoted this chapter..."


    end
  end