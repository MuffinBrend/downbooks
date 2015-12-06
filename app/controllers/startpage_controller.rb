class StartpageController < ApplicationController

  def index
    if logged_in?
      @books = []
      Rating.order(rating: :desc).limit(6).each{|r| @books.push(r.book)}

      render 'startpage/logged_in_index', layout: 'layouts/application'
    end
  end

end
