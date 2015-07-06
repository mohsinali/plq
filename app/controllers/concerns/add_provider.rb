module AddProvider
  extend ActiveSupport::Concern
  
  def create_user
    user = User.new(email: params[:user][:email], password: params[:user][:password], name: params[:user][:name], location: params[:user][:location], tier: params[:user][:tier], social_links: params[:user][:social_links], country: params[:user][:country], description: params[:user][:description], approved: true)
    if user.save
      ## #####################################
      ## Assign a role to newly created user
      user.add_role params[:role]
      
      # Add Selected services
      params[:user_service].each do |service|
        UserService.create(name: service, user_id: user.id)
      end

      # Add Selected cities
      params[:user_cities].each do |city|
        UserCity.create(name: city, user_id: user.id)
      end
      
      ## ########################
      ## Upload Profile Image      
      user.image = params[:user][:image]

      ## #####################################
      ## Assign interests
      user.interest_list.add(params[:interests], parse: true)
      user.save!
    end
  end

end