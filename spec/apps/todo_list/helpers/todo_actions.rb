require_relative 'todo_assertions'

module TodoList
  class TodoActions < TodoAssertions
    def open_app
      visit('https://setcand-te-ext.alamoapp.octanner.io/')
    end

    # add any other actions you would like to perform on the page in this class
  end
end
