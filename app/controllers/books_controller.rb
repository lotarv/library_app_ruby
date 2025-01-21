class BooksController < ApplicationController
    # Показать все книги
    def index
      @books = Book.all
    end
  
    # Показать одну книгу
    def show
      @book = Book.find(params[:id])
    end
  
    # Показать форму для создания книги
    def new
      @book = Book.new
    end
  
    # Создать новую книгу
    def create
      @book = Book.new(book_params)
      if @book.save
        redirect_to books_path, notice: 'Книга успешно добавлена!'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    # Показать форму для редактирования книги
    def edit
      @book = Book.find(params[:id])
    end
  
    # Обновить данные книги
    def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        redirect_to books_path, notice: 'Книга успешно обновлена!'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    # Удалить книгу
    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path, notice: 'Книга удалена!'
    end
  
    private
  
    # Разрешенные параметры (для безопасности)
    def book_params
      params.require(:book).permit(:title, :description, :year, :author_id, :genre_id)
    end
  end
  