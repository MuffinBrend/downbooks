class BooksController < ApplicationController
  before_action :logged_in_user

  def new
    @book = Book.new
  end

  def create
    newBook = params[:book]
    @book = Book.new(title: newBook[:title],
                     author: newBook[:author],
                     isbn: newBook[:isbn],
                     publication_date: newBook[:publication_date],
                     publisher: newBook[:publisher],
                     language: newBook[:language],
                     genre: newBook[:genre],
                     description: newBook[:description],
                     cover: newBook[:cover],
                     file: newBook[:file])
    if @book.save
      flash[:success] = "¡Libro #{@book.title} añadido con éxito!"
      redirect_to books_path
    else
      flash.now[:error] = "Ocurrió un error añadiendo el libro #{params[:book][:title]}"
      render action: 'new'
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def vote
    @book = Book.find(params[:id])
    current_user.vote(@book, params[:rating])
    render action: 'show'
  end

end
