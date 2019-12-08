class Profile < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  delegate :name, to: :prefectures
  belongs_to :user, optional: true

  enum age:         ["10歳未満","10代","20代","30代","40代","50代","60代","61歳以上"]
  enum gender:         ["男性","女性","無回答"]


  VALID_PHONE_NUMBER_HALF = /\A[0-9]+\z/

  validates :phone_number,   presence: true, uniqueness: true, format: {with: VALID_PHONE_NUMBER_HALF, message: "を半角数字で入力して下さい"}, on: :validates_step2 
  validates :self_introduction, length: {maximum: 300 }, on: :validates_step3
  validates :age,   presence: true,   presence: {message: "を選択して下さい"}, on: :validates_step3
  validates :gender,   presence: true,   presence: {message: "を選択して下さい"}, on: :validates_step3
  # validates :expert,   presence: true,   presence: {message: "を選択して下さい"}, on: :validates_step3
  # validates :release,   presence: true,   presence: {message: "を選択して下さい"}, on: :validates_step3

  




end

