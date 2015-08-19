# require('spec_helper')
#
# require('capybara/rspec')
# require('./app')
# Capybara.app = Sinatra::Application
# set(:show_expectations, false)
#
# describe('adding a new author', {:type => :feature}) do
#   it('allows a user to click an author to see the book and details for it') do
#     visit('/')
#     click_link('Add New Author')
#     fill_in('name', :with =>'Dr. Suess')
#     click_button('Add')
#     expect(page).to have_content('Successfully Added Author')
#   end
#
#   describe('adding a new book to author', {:type => :feature}) do
#     it('allows a user to add a book to an author') do
#       visit('/')
#       click_link('Add New Book')
#       fill_in('name', :with => 'Travis')
#       fill_in('title', :with => "The Lord of the Rings")
#       expect(page).to have_content('Successfully Added Book')
#     end
#   end
# end
