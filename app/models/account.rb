class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, presence: true 
  validates :profile, length: { maximum: 200 } 
  has_many :shops, dependent: :destroy
  has_many :favorites
  has_many :favorite_shops, through: :favorites, source: :shop
  has_many :comments
  mount_uploader :image, ImageUploader
end
