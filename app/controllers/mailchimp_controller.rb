class MailchimpController < ApplicationController
  include Mailchimp

	def subscribe_to_mailchimp   
    subscribe params[:email], params[:username]
    respond_to :html, :js
  end
end
