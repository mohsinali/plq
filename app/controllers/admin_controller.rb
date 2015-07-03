class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
  	@agents = User.with_role(:agent)
  	@vendors = User.with_role(:vendor)
  end

  def unapproved
    @providers = User.where(approved: false)
  end

  def add_provider
    if request.post?
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
        
        flash[:notice] = "#{params[:role].humanize} added successfully."

        redirect_to admin_index_path()
      end
    end
  end

  protected
  def authenticate_admin!
    redirect_to root_path unless current_user and current_user.has_role? :admin
  end
end
