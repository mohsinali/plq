class AgentsController < ApplicationController
	def index
    @agents = User.with_role(:agent).ransack(params[:q]).result.page(params[:page])
  end
end
