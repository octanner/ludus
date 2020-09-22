class Octanner < Utilities
  def landing_page
    @landing_page ||= OctLandingPage.new
  end
end
