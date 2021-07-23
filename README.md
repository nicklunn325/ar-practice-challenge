# ActiveRecord Code Challenge Practice - Books

For this challenge there will be three models: `Book`, `Author`, and `Genre`.

The relationships are an `Author` has many `Books`, a `Genre` has many `Books`, and a `Book` belongs to an `Author` and to a `Genre`. `Authors` and `Genres` have a many to many relationship.

**Note**: You should draw your domain on paper or on a whiteboard _before you start coding_. Remember to identify a single source of truth for your data.

Author -------< Book >-------- Genre

## Instructions

To get started, run `bundle install` while inside of this directory.

Build out all of the methods listed in the deliverables. The methods are listed in a suggested order, but you can feel free to tackle the ones you think are easiest. Be careful: some of the later methods rely on earlier ones.

**Remember!** This code challenge does not have tests. You cannot run `rspec` and you cannot run `learn`. You'll need to create your own sample instances so that you can try out your code on your own. Make sure your associations and methods work in the console before submitting.

We've provided you with a tool that you can use to test your code. To use it, run `rake console` from the command line. This will start a `pry` session with your classes defined. You can test out the methods that you write here. You are also encouraged to use the `seeds.rb` file to create sample data to test your models and associations.

## What You Start With

You begin with all of the models `Book`, `Author`, and `Genre` created and inheriting from ActiveRecord. You also start with the migration files for the `Books` and `Authors` tables.

#### Authors Table

| Column | Type    |
| ------ | ------- |
| name   | String  |
| age    | Integer |

#### Books Table

| Column      | Type    |
| ----------- | ------- |
| title       | String  |
| description | String  |
| pages       | Integer |

You will need to create the migration for the `genres` table using the attributes specified in the deliverables below. You will also need add foreign keys where necessary to establish your relationships.

## Deliverables

Write the following methods in the classes in the files provided. Feel free to build out any helper methods if needed.

Deliverables use the notation `#` for instance methods, and `.` for class methods.

Remember: Active Record give your classes access to a lot of methods already! Keep in mind what methods Active Record gives you access to on each of your classes when you're approaching the deliverables below.

### Migrations

The first thing you will need to do is to create the migration for the `genres` table. The `genres` table needs to have just one column `name` that stores a string. You will also need to add any foreign keys to either the `genres`, `books`, or `authors` tables to help establish relationships between models.

**Once you have finished your migrations** run your migrations with `rake db:migrate`

**YOU HAVE ALSO BEEN GIVEN A SEEDS FILE** after running your migrations take a look at your seeds file, it creates authors, genres, and books. **_It is not complete_** so be sure to look at it carefully and figure out what is missing.

### Object Relationships

Use ActiveRecord association macros to establish the relationships between the `Book`, `Author`, and `Genre` models.

#### Author

- `Author#books`✅
  - should return an array of all books written by author
- `Author#genres`✅
  - should return an array of all the genres the author has written books for.
- `Author#longest_book`✅
  - should return the longest book(most pages) the author has written
- `Author#write_book(title, pages, description, genre)`✅
  - takes an instance of the `Genre` class as an argument, as well as all the attributes needed to create a new instance of the `Book` class.
  - creates a new book that is associated with the author and the genre passed as an argument
  - returns the book that was created
- `Author.most_pages`✅
  - should return the author who has written the most total pages
- **BONUS:**`Author#genre_count`
  - should return a hash where the keys are the genres the author has written books for, and the values are the number of books the author wrote for that genre. i.e. `{:mystery => 2, :biography => 1, :scifi => 4}`

#### Book

- `Book#author`✅
  - should return the author the book belongs to
- `Book#genre`✅
  - should return the genre the book belongs to
- `Book.longest_book`✅
  - should return the book with highest number of pages
- `Book#spine`✅
  - should return a string containing the books title, and it's authors name i.e. `"Harry Potter - JK Rowling"`

#### Genre

- `Genre#books`✅
  - should return an array of all books belonging to genre
- `Genre#authors`✅
  - should return an array of all authors who have written books belonging to this genre
- `Genre#book_count`✅
  - returns the total number of books written for genre
- `Genre#total_pages`✅
  - returns the total pages written for that genre
- `Genre.most_popular`✅
  - returns the genre with the most books written for it
- **BONUS:** `Genre.book_count`✅
  - returns a hash where the keys are the names of the genres, and the values are the number of books written for that genre
