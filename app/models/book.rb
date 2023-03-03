class Book < ActiveRecord::Base
 
  has_many :favourites
end