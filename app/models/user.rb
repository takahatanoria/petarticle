class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :articles  
  has_many :comments  
  # has_one :profile
  
  # accepts_nested_attributes_for :profile, allow_destroy: true

  # has_one_attached :avatar
  validates  :name,  presence: true, length: { maximum: 10 }
  # has_one_attached :avatar
end
