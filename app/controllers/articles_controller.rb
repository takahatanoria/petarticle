class ArticlesController < ApplicationController
  before_action :move_to_index, except: [:index,:create, :show]

  def index
    @article = Article.includes(:user).page(params[:page]).per(10).order("created_at DESC")
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @article = Article.new
    @article.images.build
    gon.length = 0
    # 4.times{@article.images.build}
  end

  def create
    @article = Article.new(article_params)
    if @article.save && params[:images].present? 
      params[:images][:url].each do |url|
        # image_id = params[:images][:id]
      @article.images.create(url: url, article_id: @article.id)
      end
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json
      end  
    elsif @article.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json
      end  
    else
      @article.images.build
      # 4.times{@article.images.build}
      render action: :new
    end
    # Article.create(image: article_params[:image], text: article_params[:text], title: article_params[:title], user_id: current_user.id)
    # @article = Article.new(article_params)
    # if @article.save
    #   # respond_to do |format|
    #   #   format.html { redirect_to group_messages_path(@group), notice: 'メッセージが送信されました' }
    #   #   format.json
    #   # end
    # else
    #   # @articles = @group.messages.includes(:user)
    #   # flash.now[:alert] = 'メッセージを入力してください。'
    #   # render :index
    # end
  end

  def destroy
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.destroy
    end
  end

  def edit
    @article = Article.find(params[:id])
    # 5.times{@article.images.build}
    if  user_signed_in? && @article.user_id == current_user.id
      @length = @article.images.length 
      @filefield_length = 5 - @article.images.length 
      @index = -1
      gon.length = @article.images.length
      if @length == 0 
        @article.images.build
      end  
      # @article.images.build
      # if @length == 1
      #   4.times{@article.images.build}
      # elsif @length == 2
      #   3.times{@article.images.build}
      # elsif @length == 3
      #   2.times{@article.images.build}
      # elsif @length == 4
      #   1.times{@article.images.build}  
      # end
    else
      redirect_to root_path unless @article.user_id == current_user.id
    end
  end

  def update
   @article = Article.find(params[:id])
    if @article.user_id == current_user.id
      if params[:images].present? 
        params[:images][:url].each do |url|
          # image_id = params[:images][:id]
        @article.images.create(url: url, article_id: @article.id) 
        end
        # respond_to do |format|
        #   format.html { redirect_to root_path }
        #   format.json
        @article.update(article_params) 
        respond_to do |format|
          format.html { redirect_to root_path }
          format.json
        end  
      else 
        @article.update(article_params) 
        respond_to do |format|
          format.html { redirect_to root_path }
          format.json
        end  
      end  
    else  
      redirect_to action: 'edit'  
    end
  end
  
  def show
    @article = Article.find(params[:id])
    @user_article = Article.where(user_id: @article.user.id).where.not(id: @article.id).limit(16).order("created_at DESC")
  end

  private

  def article_params
    # params.require(:article).permit(:title, :content).merge(user_id: current_user.id)
    # params.require(:article).permit(:title, :content).merge(user_id: current_user.id)
    params.require(:article).permit(:title, :content, images_attributes: [:url, :id, :_destroy]).merge(user_id: current_user.id)

    # params.permit(:title, :text, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
