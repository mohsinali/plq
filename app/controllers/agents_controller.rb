class AgentsController < ApplicationController
	def index
    @agents = User.with_role(:agent).page(params[:page])
  end
end
