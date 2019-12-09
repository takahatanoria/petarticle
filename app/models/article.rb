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
  

  def self.create_ranks #Articleクラスからデータを取ってくる処理なのでクラスメソッド
    Article.find(Like.group(:article_id).order('count(article_id) desc').limit(10).pluck(:article_id))
  end

  def self.create_all_ranks #Articleクラスからデータを取ってくる処理なのでクラスメソッド
    Article.find(Like.group(:article_id).order('count(article_id) desc').pluck(:article_id))
  end



  

  # def reject_both_blank(attributes)
    # if attributes[:id]
    #   attributes.merge!(_destroy: "1") if attributes[:url].blank? and attributes[:flip].blank?
    #   !attributes[:face].blank? and attributes[:flip].blank?
    # else
    #   attributes[:face].blank? and attributes[:flip].blank?
    # end
  # end

end

