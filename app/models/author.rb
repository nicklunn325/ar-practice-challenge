class Author < ActiveRecord::Base 
    has_many :books
    has_many :genres, through: :books

    def longest_book
        self.books.order(pages: :desc).limit(1)[0]
    end

    def write_book(title, description, pages, genre)
        book = Book.create(title: title, description: description, pages: pages)
        book.author= self 
        book.genre= genre
        book.save
    end

    def total_pages
        self.books.pluck(:pages).sum
    end

    def genre_count
        self.genres.reduce({}) do |accum, genre|
            books = genre.books.where('author_id = ?', self.id)
            accum[genre.name] = books.count 
            accum
        end
    end

    def self.most_pages
        self.all.reduce do |accum, author|
            if accum.total_pages > author.total_pages
                accum
            else
                author
            end
        end
    end
end