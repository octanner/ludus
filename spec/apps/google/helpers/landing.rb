class GoogleLandingPage
  include Capybara::DSL
  include RSpec::Matchers

  def enter_search_text(search_text)
    find('lst-ib').set(search_text)
  end

  def click_search
    find('#GoogleSearch').click
  end
end
