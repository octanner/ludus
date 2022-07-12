require_relative 'todo_page_objects'

module TodoList
  class TodoAssertions < TodoListPageObjects
    include Capybara::DSL
    extend RSpec::Matchers

    def assert_item_added(item)
      # choose an assertion/validation method from rspec or capybara and validate that your item
      # was added to the to do list and write that assertion code here
    end
  end
end
