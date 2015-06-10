module Mailchimp
  extend ActiveSupport::Concern
  
  def get_lists
    @gb = Gibbon::API.new
    @gb.lists.list({:start => 0, :limit=> 100})
  end

  def subscribe email, first_name="", last_name=""
    @gb = Gibbon::API.new
    begin
      s = @gb.lists.subscribe({:id => ENV["PLQ_LIST_ID"], :email => {:email => email}, :merge_vars => {:FNAME => first_name, :LNAME => last_name}, :double_optin => false})
      puts "Subscribed #{email} to PLQ list."
    rescue Exception => e
      puts e.message
      return e.message
    end
  end

end