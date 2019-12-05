class LikesController < ApplicationController
  def create
    if user_signed_in?
      @article = Article.find(params[:article_id])
      @like = Like.new(
      user_id: current_user.id,
      article_id: params[:article_id]
      )
      @like.save
    else
      format.html {redirect_to article_path(@article), notice: 'ログインしてください' }
    end
    redirect_to article_path(@article)
  end  
  def destroy
    if user_signed_in?
      @article = Article.find(params[:article_id])
      @like = Like.find_by(
        user_id: current_user.id,
        article_id: params[:article_id]
      )
      @like.destroy
    else
    format.html {redirect_to article_path(@article), notice: 'ログインしてください' }
    end
      redirect_to article_path(@article)
  end 
  
  def topcreate
    if user_signed_in?
      article = Article.find(params[:article_id])
      @like = Like.new(
      user_id: current_user.id,
      article_id: params[:article_id]
      )
      @like.save
    else
      format.html {redirect_to articles_path(article), notice: 'ログインしてください' }
    end
  end  

  def topdestroy
    if user_signed_in?
      article = Article.find(params[:article_id])
      @like = Like.find_by(
        user_id: current_user.id,
        article_id: params[:article_id]
      )
      @like.destroy
    else
    format.html {redirect_to articles_path(article), notice: 'ログインしてください' }
    end
  end 
end
