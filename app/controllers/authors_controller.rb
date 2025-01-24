class AuthorsController < ApplicationController
    def index
        @authors = Author.all
    end

    def show
        @author = Author.find(params[:id])
    end

    def new
        @author = Author.new
    end

    def create
        @author = Author.new(author_params)
        if @author.save
            redirect_to authors_path, notice: "Автор успешно создан!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @author = Author.find(params[:id])
    end

    def update
      @author = Author.find(params[:id])
      if author.update(author_params)
        redirect_to authors_path, notice: "Автор успешно обновлен!"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @author = Author.find(params[:id])
      @author.destroy
      redirect_to authors_path, notice: "Автор удален!"
    end

    private

    def author_params
      params.require(:author).permit(:name, :bio, :birth_date)
    end
end
