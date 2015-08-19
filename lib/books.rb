class Book

  attr_reader(:title, :author_id)

  define_method(:initialize) do |attributes|
    @title = attributes.fetch(:title)
    @author_id = attributes.fetch(:author_id)
  end
end
