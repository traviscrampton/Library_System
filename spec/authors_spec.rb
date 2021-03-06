require('spec_helper')

describe(Author) do
  describe('.all') do
    it('returns an empty array at first of saved authors') do
      expect(Author.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same author if it has the same name') do
      author1 = Author.new({:name => "J.R.R Tolken", :id => nil})
      author2 = Author.new({:name => "J.R.R Tolken", :id => nil})
      expect(author1).to(eq(author2))
    end
  end

  describe('#save') do
    it('adds author to author list') do
      author1 = Author.new({:name => "J.R.R Tolken", :id => nil})
      author1.save()
      expect(Author.all()).to eq([author1])
    end
  end

  describe('.find') do
    it('returns an author by its ID') do
      test_author = Author.new({:name => "Dr. Seuss", :id => nil})
      test_author.save()
      test_author2 = Author.new({:name => "J.K. Rowling", :id => nil})
      test_author2.save()
      expect(Author.find(test_author2.id())).to(eq(test_author2))
    end
  end

  describe('#update') do
    it('updates the author in database') do
      author = Author.new({:name => 'Dr. Dre', :id => nil})
      author.save()
      author.update({:name => 'Eazy E'})
      expect(author.name()).to eq('Eazy E')
    end
  end

  describe('#delete') do
    it('lets you delete an author from the database') do
      author = Author.new({:name => "Drake", :id => nil})
      author.save()
      author2 = Author.new({:name => "Meek Mill", :id => nil})
      author2.save()
      author.delete()
      expect(Author.all()).to eq([author2])
    end
  end

end
