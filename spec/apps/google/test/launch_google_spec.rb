require 'spec_helper'
google = Google.new

feature 'Google Landing' do
  before do
    visit(ENV.fetch('GOOGLE_URL'))
  end

  context 'when visiting google page' do
    scenario 'verify landing page' do
      google.landing_page.verify_text('Google')
    end
  end
end
