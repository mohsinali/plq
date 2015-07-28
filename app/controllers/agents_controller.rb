class AgentsController < ApplicationController  
  def index
    @q = User.with_role(:agent).where(approved: true).ransack(params[:q])
    @agents = @q.result(distinct: true).includes(:user_cities, :user_services).page(params[:page])

    respond_to :html, :js
  end

  def show
  	@agent = User.where(id: params[:id])

  	respond_to do |format|
  		format.json { render :json => @agent, :include => [:user_cities, :user_services, :languages] }
  		format.html
  	end
  end

  def editable
    field_name = params[:name]
    field_value = params[:value]
    User.find(params[:pk]).update_attribute(field_name, field_value)
    
    render :text => 'success'
  end

  def service_editable
    user_id = params[:pk]
    services = params[:value]
    user = User.find(user_id)
    user.user_services.delete_all

    unless services.nil?
      services.each do |service_name|
        UserService.create(:name => service_name, :user_id => user_id)
      end
    end

    render :text => 'success'
  end

  def language_editable
    user_id = params[:pk]
    languages = params[:value]
    user = User.find(user_id)
    user.languages.delete_all

    unless languages.nil?
      languages = Language.where(:name => languages)
      user.languages << languages
      user.save
    end

    render :text => 'success'
  end

  def cities_editable
    user_id = params[:pk]
    cities = params[:value]
    user = User.find(user_id)
    user.user_cities.delete_all
    
    unless cities.nil?
      cities.each do |city|
        UserCity.create(:name => city, :user_id => user_id)
      end
    end

    render :text => 'success'
  end

  def interests_editable
    user_id = params[:pk]
    interests = params[:value]
    user = User.find(user_id)
    user.interest_list = interests
    user.save
    render :text => 'success'
  end
end