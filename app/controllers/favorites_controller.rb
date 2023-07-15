class FavoritesController < ApplicationController

    def create 
        #crea la relazione follow
        book = Book.find(params[:id])
        #current_user.follow(user)
        Follow.create(followable: book, follower: current_user)
        redirect_to root_path, notice: "Successfully followed user"
    end

    def destroy 
        #distrugge la relazione follow (unfollow)
        book = Book.find(params[:id])
        #current_user.stop_following(user)
        Follow.find_by(followable: book, follower: current_user).destroy
        redirect_to root_path, notice: "Successfully unfollowed user"
    end

end
