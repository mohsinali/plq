class MailchimpController < ApplicationController
  include Mailchimp

	def subscribe_to_mailchimp
    subscribe params[:email], params[:username], "", params[:location], params[:list]
    flash[:notice] = "Your early access request has been received."
    respond_to :html, :js
  end
end
