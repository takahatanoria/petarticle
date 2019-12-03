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


end
