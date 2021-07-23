class Author < ActiveRecord::Base 
    has_many :books
    has_many :genres, through: :books

    def longest_book
        self.books.order(pages: :desc).limit(1)[0]
    end

    def write_book(title, description, pages, genre)
        # we need to use the title, description, and pages to create a new book
        book = Book.create(title: title, description: description, pages: pages)
        # we also need to associate that book with this author (self) and the genre passed in as the 4th argument
        book.author= self # this is us connecting the author to the ruby object that represents the book in the database
                          # and while we can update the ruby object with the authors id, it doesn't save this to the database unless we explicitly tell it to
        book.genre= genre
        book.save # now we have committed to the database and our book (SSOT) will remember its author and genre
    end

    def total_pages
        self.books.pluck(:pages).sum
    end

    def genre_count
        self.genres.reduce({}) do |accum, genre|
            #need to get books for genre only written by this author
            books = genre.books.where('author_id = ?', self.id)
            # binding.pry
            accum[genre.name] = books.count # get total number of books written by author
            accum
        end
    end

    def self.most_pages
        # we need to return the author who has written the most pages
        # we need to be able to see how many pages an author has written in total
        # helper method to get an authors total pages?
        # reduce? reduce the whole array of authors down to one author who has the most total pages? 
        self.all.reduce do |accum, author|
            if accum.total_pages > author.total_pages
                accum
            else
                author
            end
        end
    end
end