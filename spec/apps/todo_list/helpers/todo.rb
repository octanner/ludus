class TodoList
  include Capybara::DSL
  include RSpec::Matchers

  def get_started
    # find('a[data-testid="start"]').click
  end


end
  