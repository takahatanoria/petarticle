class Detail < ApplicationRecord
  # def self.create_ranks #Noteクラスからデータを取ってくる処理なのでクラスメソッド！
  #   Article.find(Like.group(:article_id).order('count(article_id) desc').limit(10).pluck(:article_id))
  # end

  # def self.create_all_ranks #Noteクラスからデータを取ってくる処理なのでクラスメソッド！
  #   Article.find(Like.group(:article_id).order('count(article_id) desc').pluck(:article_id))
  # end
end
