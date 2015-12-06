class StartpageController < ApplicationController

  def index
    if logged_in?
      @top_books = []
      Rating.order(rating: :desc).limit(6).each{|r| @top_books.push(r.book)}
      @recent_books = Book.order(created_at: :desc).limit(6)
      @random_users = User.where.not(id: current_user.id).order(username: :desc).sample(6)
      render 'startpage/logged_in_index', layout: 'layouts/application'
    end
  end

end
