class TodoActions
  include Capybara::DSL
  extend RSpec::Matchers

  def open_app
    visit('https://setcand-te-ext.alamoapp.octanner.io/')
  end

  def assert_item_added(item)
    # choose an assertion/validation method from rspec or capybara to validate that your item
    # was added to the todo list and write that assertion code here
  end
end
