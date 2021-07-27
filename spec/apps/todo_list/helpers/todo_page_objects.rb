class TodoList
  include Capybara::DSL
  include RSpec::Matchers

  def get_started_button
    {
      selector: 'button[data-testid=start]',
      name: 'Lets Get Started! button'
    }
  end

  def delete_button
    {
      selector: 'button[data-testid=delete]',
      name: 'Delete Item button'
    }
  end
end
  