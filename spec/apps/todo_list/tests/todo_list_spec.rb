require 'spec_helper'
todo_list = TodoList.new

feature 'Todo List' do
  before do
    visit(ENV.fetch('TODO_URL'))
    todo_list.get_started
  end

  context 'when visiting the Todo List page' do
    scenario 'then verify the app is loaded' do
      todo.verify_text('Add Item')
    end
  end

  context 'when adding an item to the Todo list' do
    scenario 'then verify item was successfully added' do
      # todo.landing_page.verify_text('Google')
    end
  end
end