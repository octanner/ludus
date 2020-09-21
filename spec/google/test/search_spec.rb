require 'spec_helper'
google = Google.new

feature 'Search Google For Muramasa', type: :acceptance, sauce: ENV['USESAUCE'] do
  before do
    visit(yahoo.utilities.url('google'))
    google.landing_page.enter_search_text('Muramasa')
    google.landing_page.click_search
  end

  context 'when wikapedia result is clicked for Muramasa' do
    scenario 'print Muramasa birthday to console' do
      # click wikapedia result
      # capture birthday
      # print birthday
    end
  end
end
