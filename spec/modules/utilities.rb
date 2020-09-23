class Utilities
  require 'csv'
  include Capybara::DSL
  include Capybara::RSpecMatchers

  def url(app, client = nil)
    @url ||= ENV.fetch("#{[app, client].compact.join('_').upcase}_URL")
  end

  def username(name)
    ENV.fetch("#{name.upcase}_USERNAME")
  end

  def password(name)
    ENV.fetch("#{name.upcase}_PASSWORD")
  end

  def microsecond_timestamp
    Time.now.strftime('%s%6N')
  end

  def random_paragraph(timestamp = Time.now.to_i)
    "Timestamp: #{timestamp} - #{Faker::Lorem.paragraph}"
  end

  def switch_to_newly_opened_window
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  end
end
