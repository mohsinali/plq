class AgentsController < ApplicationController
	def index
    @q = User.with_role(:agent).ransack(params[:q])
    @agents = @q.result(distinct: true).includes(:user_cities, :user_services).page(params[:page])
  end
end