require 'spec_helper'

feature 'Search Muramasa', :smoke do
  before do
    visit('https://www.google.com')
  end

  scenario 'Landing_Page' do
    puts 'got here'
  end
end
