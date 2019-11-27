class ArticlesController < ApplicationController
  before_action :move_to_index, except: [:index,:create, :show]

  def index
    @article = Article.includes(:user).page(params[:page]).per(10).order("created_at DESC")
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @article = Article.new
    # @article.images.build
    # 4.times{@article.images.build}
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      params[:images][:url].each do |url|
      @article.images.create(url: url, article_id: @article.id)
      end
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json
      end  
    else
      # @article.images.build
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
    if  user_signed_in? && @article.user_id == current_user.id
    else
      redirect_to root_path unless @article.user_id == current_user.id
    end
  end

  def update
   @article = Article.find(params[:id])
    if @article.user_id == current_user.id
      @article.update(article_params)
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    # params.require(:article).permit(:title, :content).merge(user_id: current_user.id)
    params.require(:article).permit(:title, :content).merge(user_id: current_user.id)
    # params.require(:article).permit(:title, :content, images_attributes: [:url, :id]).merge(user_id: current_user.id)

    # params.permit(:title, :text, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
