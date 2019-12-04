class CommentsController < ApplicationController

  def create 
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)

    if @comment.save
      redirect_to @article
    end
    redirect_to article_path(@article)
  end

  def destroy
    #記事(article)の情報を取得
    @article = Article.find(params[:article_id])
    # その記事内の削除対象のコメントを探して取得
    @comment = @article.comments.find(params[:id])
    if @comment.destroy
      redirect_to article_path(@article)
    end
  end

  private
  def comment_params #requireでreviewバリューを取得。premitで三つをキーとする安全面で保証されたハッシュを取得。mergaメソッドで分けられたハッシュを統合。requireでメソッドで取得したハッシュと結合
    params.require(:comment).permit(:content).merge(article_id: params[:article_id], user_id: current_user.id)
  end
end
