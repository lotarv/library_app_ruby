class GenresController < ApplicationController
    def index
      @genres = Genre.all
    end
  
    def show
      @genre = Genre.find(params[:id])
    end
  
    def new
      @genre = Genre.new
    end
  
    def create
      @genre = Genre.new(genre_params)
      if @genre.save
        redirect_to genres_path, notice: 'Жанр успешно добавлен!'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @genre = Genre.find(params[:id])
    end
  
    def update
      @genre = Genre.find(params[:id])
      if @genre.update(genre_params)
        redirect_to genres_path, notice: 'Жанр успешно обновлен!'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @genre = Genre.find(params[:id])
      @genre.destroy
      redirect_to genres_path, notice: 'Жанр удален!'
    end
  
    private
  
    def genre_params
      params.require(:genre).permit(:name, :description)
    end
  end
  