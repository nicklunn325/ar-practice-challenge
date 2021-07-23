class Book < ActiveRecord::Base
    belongs_to :author
    belongs_to :genre

    def self.longest_book
        self.order(pages: :desc).limit(1)[0]
    end

    def spine
        "#{self.title} - #{self.author.name}"
    end
end