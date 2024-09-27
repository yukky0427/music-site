class UsersController < ApplicationController
    before_action :set_user, only: [:likes]

    
    
    
    def show
        @user = User.find(params[:id]) 
    end

    def after_sign_in_path_for(resource)
        user_path(resource) # ログイン後、ユーザーのマイページへリダイレクト 
    
    end


    def likes
        likes = Like.where(user_id: @user.id).pluck(:music_id)
        @like_musics = Music.find(likes)
      end
    
    private
      def set_user
        @user = User.find(params[:id])
      end


      



    

end
