require 'spec_helper'
todo_list = TodoList.new
actions = TodoActions.new

feature 'Todo List' do
  before do
    # find a way to click on the get started button
  end

  context 'when deleting an item' do
    scenario 'expect the item to be removed from the Todo list' do
     # write some code here using the helper methods and page objects to complete this task
    end
  end

  context 'when adding an item to the Todo list' do
    scenario 'then verify item was successfully added' do
      # create objects and helper methods to add an item, and verify the item was added
    end
  end
end