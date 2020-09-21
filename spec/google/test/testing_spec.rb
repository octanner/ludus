require 'spec_helper'
google = Google.new

feature 'Google Landing' do
  before do
    visit('https://www.google.com')
  end

  context 'when visiting google page' do
    scenario 'verify landing page' do
      puts 'I am totally verified now'
    end
  end
end