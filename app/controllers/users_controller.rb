class UsersController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def show
    @name = current_user.name
    @articles = Article.where(user_id: current_user.id).page(params[:page]).per(10).order("created_at DESC")
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
