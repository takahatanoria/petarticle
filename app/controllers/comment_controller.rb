class CommentController < ApplicationController

  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new
  end

  def create 
    Comment.create(create_params)
    # redirect_to controller: :products, action: :index
  end

  private
  def create_params #requireでreviewバリューを取得。premitで三つをキーとする安全面で保証されたハッシュを取得。mergaメソッドで分けられたハッシュを統合。requireでメソッドで取得したハッシュと結合
    params.require(:comment).permit(:content).merge(article_id: params[:article_id], user_id: current_user.id)
  end
end
