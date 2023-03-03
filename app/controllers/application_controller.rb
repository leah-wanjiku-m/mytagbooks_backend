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
    request.body.rewind
    request_payload = JSON.parse(request.body.read)
    book = Favourite.create(book_id: request_payload['book_id'])
    book.to_json
  end
  get '/favourites' do 
    Favourite.all.to_json(include: :book)
  end
  delete '/favourites/:id' do
    favourite = Favourite.find(params[:id])
    favourite.destroy
  end
  
end
    
   
 
  

  
  
  
  
