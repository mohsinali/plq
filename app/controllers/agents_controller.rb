class AgentsController < ApplicationController  
  def index
    @q = User.with_role(:agent).ransack(params[:q])
    @agents = @q.result(distinct: true).includes(:user_cities, :user_services).page(params[:page])

    respond_to :html, :js
  end

  def show
  	@agent = User.where(id: params[:id]).includes(:user_cities)

  	respond_to do |format|
  		format.json { render :json => @agent, :include => [:user_cities, :user_services] }
  		format.html
  	end
  end

  def editable
    field_name = params[:name]
    field_value = params[:value]
    User.find(params[:pk]).update_attribute(field_name, field_value)
    
    render :text => 'success'
  end
end