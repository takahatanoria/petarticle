class GenresController < ApplicationController

  # ジャンルごとに記事を5件づつ最新順に取得
  def dog
    @articles_dog = Article.where(:genre_id => 1).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def cat
    @articles_cat = Article.where(:genre_id => 2).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def small_animal
    @articles_small_animal = Article.where(:genre_id => 3).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def bird
    @articles_bird = Article.where(:genre_id => 4).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def fish
    @articles_fish = Article.where(:genre_id => 5).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def reptile
    @articles_reptile = Article.where(:genre_id => 6).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def genre_other
    @articles_genre_other = Article.where(:genre_id => 7).includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

end
