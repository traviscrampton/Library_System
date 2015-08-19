require('spec_helper')

describe(Book) do
  describe('.all') do
    it('starts as an emptoy array for books') do
      expect(Book.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("is the same book if it has the same title and author id") do
      book1 = Book.new({:title => "The Hobbit", :author_id => 1})
      book2 = Book.new({:title => "The Hobbit", :author_id => 1})
      expect(book1).to(eq(book2))
    end
  end

  describe("#save") do
    it("adds a book to the array of saved books") do
      test_book = Book.new({:title => "The Hobbit", :author_id => 1})
      test_book.save()
      expect(Book.all()).to(eq([test_book]))
    end
  end
end
