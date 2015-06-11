class MailchimpController < ApplicationController
  include Mailchimp

	def subscribe_to_mailchimp   
    subscribe params[:email], params[:username]
    flash[:notice] = "Your early access request has been received."
    respond_to :html, :js
  end
end
