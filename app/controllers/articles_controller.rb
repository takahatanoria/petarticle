class ArticlesController < ApplicationController
  before_action :move_to_index, except: [:index,:create, :show]

  def index
    @articles = Article.includes(:user).page(params[:page]).per(10).order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
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
    # params.require(:article).permit(:title, :text).merge(user_id: current_user.id)
    params.require(:article).permit(:title, :text, :image).merge(user_id: current_user.id)

    # params.permit(:title, :text, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
