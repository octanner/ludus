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
  context 'when deleting an item' do
    scenario 'expect the item to be removed from the Todo list' do
      binding.pry
      # write your code to complete and validate the actions in the scenario.
    end
  end

  context 'when adding an item to the Todo list' do
    scenario 'then verify item was successfully added' do
      # create new page objects and helper methods to add an item, and verify the item was added
    end
  end
end
