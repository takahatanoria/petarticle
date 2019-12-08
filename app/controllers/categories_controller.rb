class CategoriesController < ApplicationController
  before_action :set_category


  # def index
  #   @articles_discipline = Article.where(:category_id => 2).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  # end  

  # カテゴリごとに記事を5件づつ最新順に取得
  def walk
    @articles_walk = Article.where(:category_id => 1).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def discipline
    @articles_discipline = Article.where(:category_id => 2).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def sick
    @articles_sick= Article.where(:category_id => 3).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def life
    @articles_life= Article.where(:category_id => 4).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def food
    @articles_food= Article.where(:category_id => 5).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def rearing
    @articles_rearing= Article.where(:category_id => 6).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def question
    @articles_question= Article.where(:category_id => 7).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def story
    @articles_story= Article.where(:category_id => 8).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def petloss
    @articles_petloss= Article.where(:category_id => 9).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def other
    @articles_other= Article.where(:category_id => 10).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  private

  def set_category
    @categories = Category.all
  end



end
