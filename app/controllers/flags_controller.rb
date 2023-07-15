class FlagsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_review
    def create


        if already_flagged?
            flash[:notice] = "You can't like more than once"

        else

            @review.flags.create(user_id: current_user.id)
        end

        redirect_to review_path(@review)
        
    end  
    private  
    def find_review
        @review = Review.find(params[:review_id])
    end
    def already_flagged?
        Flag.where(user_id: current_user.id, review_id:params[:review_id]).exists?
      end
    
end
