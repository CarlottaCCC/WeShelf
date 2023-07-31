class FollowsController < ApplicationController
    def create
        #crea la relazione follow
        user = User.find(params[:id])
        #current_user.follow(user)
        Follow.create(followable: user, follower: current_user)
        redirect_to user_path(user) , notice: "Successfully followed user"
  
    end

    def destroy
        #distrugge la relazione follow (unfollow)
        user = User.find(params[:id])
        #current_user.stop_following(user)
        Follow.find_by(followable: user, follower: current_user).destroy
        redirect_to user_path(user), notice: "Successfully unfollowed user"

    end

    def index_following

        @user = User.find(params[:id])
        @following = @user.following_by_type('User')

    end

    def index_followers 

        @user = User.find(params[:id])
        @followers = @user.followers

    end


  end
  