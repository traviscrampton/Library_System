require('spec_helper')

describe(Author) do
  describe('.all') do
    it('returns an empty array at first of saved authors') do
      expect(Author.all()).to(eq([]))
    end
  end
end
