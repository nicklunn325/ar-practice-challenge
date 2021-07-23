
## HERE IS YOUR SEEDS FILE ## IT IS DESIGNED TO CREATE DATA FOR YOU TO TEST YOUR WORK ON ## IT MAY BE MISSING SOME IMPORTANT PIECES

puts "destroying everything..."
Book.destroy_all
Genre.destroy_all
Author.destroy_all

puts "creating authors..."

10.times do 
    Author.create(name: Faker::Book.author, age: rand(1..100))
end

puts "creating genres..."

10.times do
    Genre.create(name: Faker::Book.genre)
end

puts "creating books..."

100.times do
    Book.create(title: Faker::Book.title, description: Faker::Books::Dune.quote, pages: rand(50..1000), author_id: rand(1..10) , genre_id:rand(1..10))
end