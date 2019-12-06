class Article < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :category
  belongs_to :genre
  # has_many :stocks, dependent: :destroy  
  has_many :likes, dependent: :destroy    
  
  accepts_nested_attributes_for :images, allow_destroy: true
  validates  :title,  presence: true, length:{minimum: 1,maximum: 40}
  validates :content, presence: true, length:{minimum: 1,maximum: 1000}
  validates :category_id, presence: {message:  "を選択して下さい"}
  validates :genre_id, presence: {message:  "を選択して下さい"}
  


  # def reject_both_blank(attributes)
    # if attributes[:id]
    #   attributes.merge!(_destroy: "1") if attributes[:url].blank? and attributes[:flip].blank?
    #   !attributes[:face].blank? and attributes[:flip].blank?
    # else
    #   attributes[:face].blank? and attributes[:flip].blank?
    # end
  # end

end

