class AgentsController < ApplicationController
	def index
    @q = User.with_role(:agent).ransack(params[:q])
    @agents = @q.result.page(params[:page])
  end
end