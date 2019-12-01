class ArticlesController < ApplicationController
  before_action :move_to_index, except: [:index,:create, :show]

  def index
    @articles = Article.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    @articles_other = Article.includes(:user).limit(10).order("created_at DESC")
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @article = Article.new
    @article.images.build
    gon.length = 0
  end

  def create
    @article = Article.new(article_params)
    if @article.save && params[:images].present? 
      params[:images][:url].each do |url|
      @article.images.create(url: url, article_id: @article.id)
      end
      # respond_to do |format|
      #   format.html { redirect_to root_path }
      #   format.json
      # end  
    elsif @article.save
      # respond_to do |format|
      #   format.html { redirect_to root_path }
      #   format.json
      # end  
    else
      @article.images.build
      render action: :new
    end
  end

  def destroy
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json
      end  
    end
  end

  def edit
    @article = Article.find(params[:id])
    if  user_signed_in? && @article.user_id == current_user.id
      @length = @article.images.length 
      @filefield_length = 5 - @article.images.length 
      @index = -1
      gon.length = @article.images.length
      if @length == 0 
        @article.images.build
      end  
    else
      redirect_to root_path unless @article.user_id == current_user.id
    end
  end

  def update
   @article = Article.find(params[:id])
    if @article.user_id == current_user.id
      if params[:images].present? 
        params[:images][:url].each do |url|
        @article.images.create(url: url, article_id: @article.id) 
        end
        # respond_to do |format|
        #   format.html { redirect_to root_path }
        #   format.json
        @article.update(article_params) 
        # respond_to do |format|
        #   format.html { redirect_to root_path }
        #   format.json
        # end  
      else 
        @article.update(article_params) 
        # respond_to do |format|
        #   format.html { redirect_to root_path }
        #   format.json
        # end  
      end  
    else  
      redirect_to action: 'edit'  
    end
  end
  
  def show
    @article = Article.find(params[:id])
    if @article.present? 
      @user_article = Article.where(user_id: @article.user.id).where.not(id: @article.id).limit(16).order("created_at DESC")
      @comment_article = Comment.where(article_id: @article.id).limit(5).order("created_at DESC")
      @comment = Comment.new
      @comment_all = Comment.where(article_id: @article.id).order("created_at DESC")
    else 
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json
      end  
    end  
  end

  # def search
  #   # 検索フォームのキーワードをあいまい検索して、productsテーブルから20件の作品情報を取得する
  #   @article = Article.where('titile LIKE(?)',"%#{params[:keyword]}%")
  # end

  private

  def article_params
    params.require(:article).permit(:title, :content, images_attributes: [:url, :id, :_destroy]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to redirect_to root_path unless user_signed_in?
  end

end
