require('sinatra')
require('sinatra/reloader')
require('./lib/book')
require('./lib/author')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "library_system"})

get('/') do
  erb(:index)
end

get('/authors/new') do
  erb(:author_form)
end

get('/books/new') do
  @authors = Author.all()
  erb(:book_form)
end

post("/authors") do
  name = params.fetch("name")
  author = Author.new({:name => name, :id => nil})
  author.save()
  erb(:author_success)
end

get("/authors") do
  @authors = Author.all()
  erb(:authors)
end

get('/authors/:id') do
  @author = Author.find(params.fetch('id').to_i())
  erb(:author)
end

post('/authors/:id') do
  title = params.fetch('title')
  author_id = params.fetch('author_id').to_i()
  @author = Author.find(author_id)
  @book = Book.new({:title => title, :author_id => author_id})
  @book.save()
  erb(:book_success)
end
