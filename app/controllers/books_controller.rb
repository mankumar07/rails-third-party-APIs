class BooksController < ApplicationController
  def create               
    BookCreator.call(params)
  end
end
