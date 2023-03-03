class ApplicationController < Sinatra::Base
  
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get '/books' do
    books = Book.all
    books.to_json
  end

  get '/books/search' do
    title = params[:title]
    books = Book.where("title LIKE ?", "%#{title}%")
    books.to_json
  end
  post '/favourites' do
    book= Favourite.create (params)
    book.to_json
  end
    # book_id = params[:book_id]
  
    # if book_id.blank?
    #   # Return an error message if book_id is empty
    #   { error: "book_id cannot be empty" }.to_json
    # else
    #   # Create the new favorite
    #   favourite = Favourite.find_or_create_by(book_id: book_id)
  
    #   if favourite.save
    #     { message: "Book added to favorites", favourite: favourite }.to_json
    #   else
    #     { message: "Error adding book to favorites" }.to_json
    #   end
    # end
  end
  
  # post '/favourites' do
  #   begin
  #     puts "Incoming params: #{params.inspect}"
  #     puts params.inspect
  #     book_id = params[:book_id]
  #     puts "book_id: #{book_id.inspect}"
  #     favourite = Favourite.find_or_create_by(book_id: book_id)
  #     if favourite.save
  #       { message: "Book added to favorites", favourite: favourite }.to_json
  #     else
  #       { message: "Error adding book to favorites" }.to_json
  #     end
  #   rescue => e
  #     { error: e.message }.to_json
  #   end
  # end
  
  
#   get '/favourites' do
#     favourites = Favourite.includes(:book).all
#     content_type :json # set the content type to JSON
#     favourites.to_json(include: { book: { only: [:id, :title, :description, :image_url] }})
#   end
  
  
# end

  
  
  
  
