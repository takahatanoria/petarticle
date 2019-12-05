class LikesController < ApplicationController
  def create
    if user_signed_in?
      @article = Article.find(params[:article_id])
      @like = Like.new(
      user_id: current_user.id,
      article_id: params[:article_id]
      )
      if @like.present? 
        @like.save
        redirect_to article_path(@article), notice: 'いいね！しました'
      else
      end
    else
      redirect_to article_path(@article), notice: 'ログインしてください'    
    end
  end  

  def destroy
    if user_signed_in? 
      @article = Article.find(params[:article_id])
      @like = Like.find_by(
        user_id: current_user.id,
        article_id: params[:article_id]
      )
      if @like.present? 
        @like.destroy
        redirect_to article_path(@article), notice: 'いいね！を取り消しました'
      else
      end
    else
      redirect_to article_path(@article), notice: 'ログインしてください'
    end 
  end 
  
  def topcreate
    if user_signed_in?
      article = Article.find(params[:article_id])
      @like = Like.new(
      user_id: current_user.id,
      article_id: params[:article_id]
      )
      if @like.present?  
        @like.save
        redirect_to articles_path, notice: 'いいね！しました'
      else
      end
    else
      redirect_to articles_path(article), notice: 'ログインしてください'
    end
  end  

  def topdestroy
    if user_signed_in?
      article = Article.find(params[:article_id])
      @like = Like.find_by(
        user_id: current_user.id,
        article_id: params[:article_id]
      )
      if @like.present?  
        @like.destroy
        redirect_to articles_path, notice: 'いいね！を取り消しました'
      else
      end
    else  
      redirect_to articles_path(article), notice: 'ログインしてください'
    end 

  end

end  
