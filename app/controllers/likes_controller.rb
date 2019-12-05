class LikesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @like = Like.new(
    user_id: current_user.id,
    article_id: params[:article_id]
    )
    @like.save
    redirect_to article_path(@article), notice: 'いいね！しました' 
    # respond_to do |format|
    #   format.html { redirect_to article_path, notice: 'いいね！しました' }
    #   format.json { render json: @like}
    # end
  end  

  def destroy
    @article = Article.find(params[:article_id])
    @like = Like.find_by(
      user_id: current_user.id,
      article_id: params[:article_id]
    )
    @like.destroy
    redirect_to article_path(@article), notice: 'いいね！を取り消しました' 
    # respond_to do |format|
    #   format.html { redirect_to article_path, notice: 'いいね！を取り消しました' }
    #   format.json { render json: @like}
    # end
  end  

  # private

  # def like_params
  #   params.require(:like).permit(:article_id).merge(user_id: current_user.id,:article_id )
  # end
end
