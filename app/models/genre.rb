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
        # return the genre that has the most books written for it
        # we can use book_count to help?
        # reduce like in the author class?
        self.all.reduce do |accum, genre|
            if accum.book_count > genre.book_count
                accum
            else
                genre
            end
        end
    end

    def self.book_count
        # returns a hash where the keys are genre names and the values are their book counts
        self.all.reduce({}) do |accum, genre| # what our accum starts as {}
            # turn genre.name into a symbol ?
            # binding.pry
            # genre_name = genre.name.to_s
            accum[genre.name] = genre.book_count # as opposed to an integer
            accum # return the whole hash
        end
    end
end