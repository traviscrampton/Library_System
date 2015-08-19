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
end
