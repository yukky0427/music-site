class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :musics
  has_many :musics, dependent: :destroy #追記 ユーザーが削除されたら、ツイートも削除されるようになります。すでに書いてある場合は追記しなくて大丈夫です。
  has_many :likes, dependent: :destroy
  has_many :liked_musics, through: :likes, source: :music

  def already_liked?(music)
    self.likes.exists?(music_id: music.id)
  end

  
  
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 } 
  
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable


end
