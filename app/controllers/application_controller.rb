class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!, except: [:index, :show, :entry_signup, :step1, :step2, :step3, :done,:sign_in, :latest]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?
  before_action :set_search
  before_action :set_category
  before_action :set_genre

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
      @search_articles = @search.result.order("created_at DESC").limit(10)
      @search_articles_all = @search.result.order("created_at DESC")
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

  def set_category
    @categories = Category.all
  end

  def set_genre
    @genres = Genre.all
  end

  def production?
    Rails.env.production?
  end


end
