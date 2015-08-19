class Book

  attr_reader(:title, :author_id, :id)

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
    result = DB.exec("INSERT INTO books (title, author_id) VALUES ('#{@title}', #{@author_id}) RETURNING id;")
    @id = result.first.fetch('id')
  end

  define_method(:==) do |another_book|
    self.title().==(another_book.title()).&(self.author_id().==(another_book.author_id()))
  end

  define_method(:update) do |attributes|
    @title = attributes.fetch(:title)
    @id = self.id
    @author_id = self.author_id
    DB.exec("UPDATE books SET title = '#{@title}', author_id = #{@author_id} WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM books WHERE id = #{self.id()};")
  end
end
