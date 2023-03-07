class BookCreator < ApplicationService
  
  def initialize(params)
    @title = params[:title]
    @description = params[:description]
    @author_id = params[:author_id]
    @genre_id = params[:genre_id]
  end

  def call
    create_book
  end

  private
  
  def create_book
    Book.create!(
      title: @title,
      description: @description,
      author_id: @author_id,
      genre_id: @genre_id
    )
  end
end

