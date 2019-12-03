class CategoriesController < ApplicationController

  # def index
  #   @articles_discipline = Article.where(:category_id => 2).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  # end  

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
    @articles_life= Article.where(:category_id => 5).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def rearing
    @articles_life= Article.where(:category_id => 6).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def question
    @articles_life= Article.where(:category_id => 7).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def story
    @articles_life= Article.where(:category_id => 8).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def petloss
    @articles_life= Article.where(:category_id => 9).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def other
    @articles_life= Article.where(:category_id => 10).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  



end
