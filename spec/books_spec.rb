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

  describe('#update') do
    it('lets you update books in the database') do
      book = Book.new({:title => "Where the Red Fern Grows", :author_id => 1, :id => nil})
      book.save()
      book.update({:title => "Huckleberry Finn", :author_id => book.author_id()})
      expect(book.title()).to(eq("Huckleberry Finn"))
    end
  end

  describe('#delete') do
    it('lets you delete a book from the database') do
      book = Book.new({:title => "Holes", :author_id => 1, :id => nil})
      book.save()
      book2 = Book.new({:title => "The Davinchi Code", :author_id => 1,  :id => nil})
      book2.save()
      book.delete()
      expect(Book.all()).to eq([book2])
    end
  end
end
