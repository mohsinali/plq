class VisitorsController < ApplicationController
  layout 'home'
  include Mailchimp

  def index
    subscribe "mohsin360@outlook.com", "Wasim"
  end
end
