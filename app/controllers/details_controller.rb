class DetailsController < ApplicationController

  def latest
    @articles = Article.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def ranking
    @articles = Article.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def search
    # @search = Article.ransack(params[:q])
    # if params[:q] != nil
    #   params[:q]['title_or_content_cont_all'] = params[:q]['title_or_content_cont_all'].split(/[\s\p{blank}]+/)
    #   @search = Article.ransack(params[:q])
    #   @search_articles = @search.result.order("created_at DESC").limit(10)
    #   # @article = Article.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    # else
    #   @search = Article.ransack(params[:q])
    #   @article = Article.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    # end
  end


end
