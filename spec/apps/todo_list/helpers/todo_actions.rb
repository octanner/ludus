class TodoActions
  include Capybara::DSL
  extend RSpec::Matchers

  def open_app
    visit('https://setcand-te-ext.alamoapp.octanner.io/')
  end

  def find_row_with_text(text)
    find('tr', text: text)
  end

  def validate_item_removed(item)
    # build your own helper by using capybara or rspec assertions.
  end
end
