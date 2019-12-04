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





  # def set_search
  #   # @search = Article.ransack(params[:q])
  #   condition = Hash.new
  #   # @search = Array.new 

  #   if params[:q].kind_of?(Hash)
  #     params[:q].each do |key, value|
  #       if key == 'title_or_content_cont_all' then
  #       [:title_or_content_cont_all] = params[:q][:title_or_content_cont_all].split(/[ 　]+/)
  #     @search = Article.ransack(params[:q])
  #     @search_articles = @search.result.page(params[:page]).per(5).order("created_at DESC")
  #     # @article = Article.includes(:user).page(params[:page]).per(5).order("created_at DESC")

  #   else
  #     @search = Article.ransack(params[:q])
  #     @article = Article.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  #   end
  # end


  def set_search
    if params[:q] != nil
      params[:q]['title_or_content_cont_all'] = params[:q]['title_or_content_cont_all'].split(/[\s\p{blank}]+/)
      @search = Article.ransack(params[:q])
      @search_articles = @search.result.page(params[:page]).order("created_at DESC")
      # @article = Article.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    else
      @search = Article.ransack(params[:q])
      @article = Article.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    end
  end


  # def set_search
  #   if params[:q] != nil
  #     params[:q]['title_or_content_cont_all'] = params[:q]['title_or_content_cont_all'].split(/[\s|\p{blank}]+/)
  #     @search = Article.ransack(params[:q])
  #     @search_articles = @search.result.page(params[:page]).order("created_at DESC")
  #     # @article = Article.includes(:user).page(params[:page]).per(5).order("created_at DESC")

  #   else
  #     @search = Article.ransack(params[:q])
  #     @article = Article.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  #   end
  # end
  



    # @search = Article.ransack(params[:q])
    # unless params[:q].blank?
    #   @search_articles = @search.result.page(params[:page]).per(5).order("created_at DESC")
    # else
    #   @article = Article.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    # end



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
