require 'spec_helper'
google = Google.new

feature 'Google Landing' do
  before do
    visit(yahoo.utilities.url('google'))
  end

  context 'when visiting google page' do
    scenario 'verify landing page' do
      google.landing_page.verify_text('Google')
    end
  end
end
