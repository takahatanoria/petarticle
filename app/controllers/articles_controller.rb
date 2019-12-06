class ArticlesController < ApplicationController
  before_action :move_to_index, except: [:index,:create, :show]



  def index
    @articles = Article.includes(:user).page(params[:page]).per(3).order("created_at DESC")
    @articles_other = Article.includes(:user).limit(10).order("created_at DESC")
    @category_number = 1
    @articles_walk = Article.where(:category_id => 1).includes(:user).page(params[:page]).per(3).order("created_at DESC")
    @articles_discipline = Article.where(:category_id => 2).includes(:user).page(params[:page]).per(3).order("created_at DESC")
    @articles_sick= Article.where(:category_id => 3).includes(:user).page(params[:page]).per(3).order("created_at DESC")
    @articles_life= Article.where(:category_id => 4).includes(:user).page(params[:page]).per(3).order("created_at DESC")
    @articles_food= Article.where(:category_id => 5).includes(:user).page(params[:page]).per(3).order("created_at DESC")
    @articles_rearing= Article.where(:category_id => 6).includes(:user).page(params[:page]).per(3).order("created_at DESC")
    @articles_question= Article.where(:category_id => 7).includes(:user).page(params[:page]).per(3).order("created_at DESC")
    @articles_story= Article.where(:category_id => 8).includes(:user).page(params[:page]).per(3).order("created_at DESC")
    @articles_petloss= Article.where(:category_id => 9).includes(:user).page(params[:page]).per(3).order("created_at DESC")
    @articles_other= Article.where(:category_id => 10).includes(:user).page(params[:page]).per(3).order("created_at DESC")
    
    @articles_dog = Article.where(:genre_id => 1).includes(:user).page(params[:page]).per(3).order("created_at DESC")
    @articles_cat = Article.where(:genre_id => 2).includes(:user).page(params[:page]).per(3).order("created_at DESC")
    @articles_small_animal = Article.where(:genre_id => 3).includes(:user).page(params[:page]).per(3).order("created_at DESC")
    @articles_bird = Article.where(:genre_id => 4).includes(:user).page(params[:page]).per(3).order("created_at DESC")
    @articles_fish = Article.where(:genre_id => 5).includes(:user).page(params[:page]).per(3).order("created_at DESC")
    @articles_reptile = Article.where(:genre_id => 6).includes(:user).page(params[:page]).per(3).order("created_at DESC")
    @articles_genre_other = Article.where(:genre_id => 7).includes(:user).page(params[:page]).per(3).order("created_at DESC")
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
      # バリデーション設定時に仕様確認
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
    if user_signed_in? && article.user_id == current_user.id
      article.destroy
      redirect_to root_path, notice: '記事を削除しました'
    else
      render :show
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
        # バリデーション設定時に仕様確認
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
    # article = Article.find(params[:id])
    @likes_count = Like.where(article_id: @article.id).count
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


  private

  def article_params
    params.require(:article).permit(:title, :content, :category_id, :genre_id, images_attributes: [:url, :id, :_destroy]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to redirect_to root_path unless user_signed_in?
  end



end
