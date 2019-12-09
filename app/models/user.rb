class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :articles  
  has_many :comments  
  has_one :profile


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]


         def self.find_for_oauth(auth)
          user = User.where(uid: auth.uid, provider: auth.provider).first
      
          unless user
        
            user = User.create(
              uid:      auth.uid,
              provider: auth.provider,
              name:     auth.info.name,
              email:    User.dummy_email(auth),
              password: Devise.friendly_token[0, 20],
            
            )
          end
      
          user
        end
      
        private
      
        def self.dummy_email(auth)
          "#{auth.uid}-#{auth.provider}@example.com"
        end


  # accepts_nested_attributes_for :profile, allow_destroy: true

  # has_one_attached :avatar


  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  validates  :name,  presence: true, length: {minimum: 1, maximum: 10 }, on: :validates_step1
  validates :email,                 presence: true, length:{maximum: 128}, uniqueness: true, format: {with: VALID_EMAIL_REGEX}, on: [:validates_step1,]
  validates :password,              presence: true, length: {minimum: 6, maxinum: 128}, on: :validates_step1
  validates :password_confirmation, presence: true, length: {minimum: 6, maxinum: 128}, on: :validates_step1
  # has_one_attached :avatar
end
