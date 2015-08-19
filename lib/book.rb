class Book

  attr_reader(:title, :author_id)

  define_method(:initialize) do |attributes|
    @title = attributes.fetch(:title)
    @author_id = attributes.fetch(:author_id)
  end

  define_singleton_method(:all) do
    returned_books = DB.exec("SELECT * FROM books;")
    books = []
    returned_books.each() do |book|
      title = book.fetch('title')
      author_id = book.fetch('author_id').to_i()
      books.push(Book.new({:title => title, :author_id => author_id}))
    end
    books
  end

  define_method(:save) do
    DB.exec("INSERT INTO books (title, author_id) VALUES ('#{@title}', #{@author_id});")
  end

  define_method(:==) do |another_book|
    self.title().==(another_book.title()).&(self.author_id().==(another_book.author_id()))
  end

end
