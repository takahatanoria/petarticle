class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?
  before_action :set_search

  def after_sign_out_path_for(resource)
    '/users/sign_in' # サインアウト後のリダイレクト先URL
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
  # end

  # def index
  #   @article = Article.includes(:user).page(params[:page]).per(10).order("created_at DESC")
  # end

  # def index
  #   @article = Article.includes(:user).page(params[:page]).per(10).order("created_at DESC")
  # end

  def set_search
    @search = Article.ransack(params[:q])
    unless params[:q].blank?
      @search_articles = @search.result.page(params[:page]).per(10).order("created_at DESC")
      # @article = Article.includes(:user).page(params[:page]).per(10).order("created_at DESC")
    else
      @article = Article.includes(:user).page(params[:page]).per(10).order("created_at DESC")
    end
  end



  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
