# Code can be completed using capybara or rspec, plus any existing helper methods and page objects
# to complete the tasks. Feel free to ask someone for help with method names or the types
# of methods available. Calling the method binding.pry can act as a breakpoint in your code
#
# Capybara documentation can be found at:
# https://www.rubydoc.info/gems/capybara/Capybara/Minitest/Assertions
# Rspec documentation can be found at:
# https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/include-matcher

require 'spec_helper'

todo_list = TodoList.new
actions = TodoActions.new

feature 'Todo List' do
  before do
    binding.pry
    # find a way to open the app, find the 'get started button, and click on it.
  end

  context 'when adding an item to the Todo list' do
    scenario 'then verify item was successfully added' do
      # create a test here by using page objects and helpers
    end
  end

  # create your own context and scenario to test another CRUD action on a list item
end