class MusicsController < ApplicationController
    
 before_action :authenticate_user!, only: [:new, :create]
    
    
    
    def index
        
      @musics=Music.all
        if params[:search] != nil && params[:search] != ''
            #部分検索かつ複数検索
            search = params[:search]
            @musics = Music.joins(:user).where("body LIKE ? OR artist_name LIKE ? OR music_name LIKE? OR feel LIKE? OR genre LIKE?", "%#{search}%", "%#{search}%","%#{search}%","%#{search}%","%#{search}%")
          else
            @musics = Music.all
         

        end

        @musics = @musics.page(params[:page]).per(5)

    end

    
    
    
    def new
        @music = Music.new
      end
    
    def create
        music = Music.new(music_params)
        
        music.user_id = current_user.id  
        
        
        if music.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
        @music = Music.find(params[:id])
    end
    
    def edit
        @music = Music.find(params[:id])
    end
     
    def update
        music = Music.find(params[:id])
        if music.update(music_params)
          redirect_to :action => "show", :id => music.id
        else
          redirect_to :action => "new"
        end
    end
    
      


      
      
      
    def destroy
        music = Music.find(params[:id])
        music.destroy
        redirect_to action: :index
    end
    
      
      
      
      
      private
      def music_params
        params.require(:music).permit(:music_name, :artist_name, :genre, :body, :url, :feel, :image)
      end
    







end
