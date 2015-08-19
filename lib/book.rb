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
      books.push(book.new({:title => title, :author_id => author_id}))
    end
    books
  end

end
