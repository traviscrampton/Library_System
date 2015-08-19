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
