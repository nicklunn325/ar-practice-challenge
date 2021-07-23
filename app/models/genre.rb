class Genre < ActiveRecord::Base
    has_many :books
    has_many :authors, through: :books

    def book_count
        self.books.length
    end

    def total_pages
        self.books.pluck(:pages).sum
    end

    def self.most_popular
        self.all.reduce do |accum, genre|
            if accum.book_count > genre.book_count
                accum
            else
                genre
            end
        end
    end

    def self.book_count
        self.all.reduce({}) do |accum, genre| 
            accum[genre.name] = genre.book_count 
            accum 
        end
    end
end