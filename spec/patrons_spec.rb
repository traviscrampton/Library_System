require('spec_helper')

describe(Patron) do
  describe('.all') do
    it('returns an empty array at first of saved patrons') do
      expect(Patron.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same patron if it has the same name') do
      patron1 = Patron.new({:name => "Kevin Parker", :id => nil})
      patron2 = Patron.new({:name => "Kevin Parker", :id => nil})
      expect(patron1).to(eq(patron2))
    end
  end

  describe('#save') do
    it('adds patron to patron list') do
      patron1 = Patron.new({:name => "Kevin Parker", :id => nil})
      patron1.save()
      expect(Patron.all()).to eq([patron1])
    end
  end

  describe('.find') do
    it('returns an patron by its ID') do
      test_patron = Patron.new({:name => "Jeff Ross", :id => nil})
      test_patron.save()
      test_patron2 = Patron.new({:name => "Donald Trump", :id => nil})
      test_patron2.save()
      expect(Patron.find(test_patron2.id())).to(eq(test_patron2))
    end
  end

  describe('#update') do
    it('lets you update patrons in the database') do
      patron = Patron.new({:name => "Jimmy Stewart", :id => nil})
      patron.save()
      patron.update({:name => "Huckleberry Finn"})
      expect(patron.name()).to(eq("Huckleberry Finn"))
    end
  end

  describe('#delete') do
    it('lets you delete a patron from the database') do
      patron = Patron.new({:name => "Bernie Sanders", :id => nil})
      patron.save()
      patron2 = Patron.new({:name => "Jeb Bush", :id => nil})
      patron2.save()
      patron.delete()
      expect(Patron.all()).to eq([patron2])
    end
  end

end
