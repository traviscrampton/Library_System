require('spec_helper')

describe(Book)
  describe('.all') do
    it('starts as an emptoy array for books') do
      expect(Book.all()).to(eq([]))
    end
  end
