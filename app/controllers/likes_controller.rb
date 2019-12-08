class LikesController < ApplicationController


  def create
    if user_signed_in?
      @article = Article.find(params[:article_id])
      # 重複レコード作成防止
      @like = Like.where(user_id: current_user.id,
        article_id: params[:article_id]).first_or_initialize
      # 重複レコード作成防止前のコード非同期通信実装できたら消す
      #   .new(
      # user_id: current_user.id,
      # article_id: params[:article_id]
      # )
      
      if @like.present? 
        @like.save
        # 詳細画面へリダイレクト
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
        # 詳細画面へリダイレクト
        redirect_to article_path(@article), notice: 'いいね！を取り消しました'
      else
      end
    else
      redirect_to article_path(@article), notice: 'ログインしてください'
    end 
  end 
  


  # indexへリダイレクト用 非同期通信実装時に消す
  def topcreate
    if user_signed_in?
      article = Article.find(params[:article_id])
      # 重複レコード作成防止
      @like = Like.where(user_id: current_user.id,
        article_id: params[:article_id]).first_or_initialize
            # 重複レコード作成防止前のコード非同期通信実装できたら消す
      # @like = Like.new(
      # user_id: current_user.id,
      # article_id: params[:article_id]
      # )
        if @like.present?  
        @like.save
        # index画面へリダイレクト 
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
        # index画面へリダイレクト 
        redirect_to articles_path, notice: 'いいね！を取り消しました'
      else
      end
    else  
      redirect_to articles_path(article), notice: 'ログインしてください'
    end 
  end

end  
