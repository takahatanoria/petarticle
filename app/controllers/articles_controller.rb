class ArticlesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @articles = Article.order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    # @article = Article.new
  end

  def create
    Article.create(image: article_params[:image], text: article_params[:text], title: article_params[:title], user_id: current_user.id)
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
  
  private
  def article_params
    # params.require(:article).permit(:title, :text, :image).merge(user_id: current_user.id)
    params.permit(:title, :text, :image)

    # params.permit(:title, :text, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
