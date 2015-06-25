class VendorsController < ApplicationController
  def index
    @q = User.with_role(:vendor).ransack(params[:q])
    @vendors = @q.result(distinct: true).includes(:user_cities, :user_services).page(params[:page])

    respond_to :html, :js
  end
end
