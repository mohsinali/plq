class VendorsController < ApplicationController
  def index
    @q = User.with_role(:vendor).ransack(params[:q])
    @vendors = @q.result(distinct: true).includes(:user_cities, :user_services).page(params[:page])

    respond_to :html, :js
  end

  def show
    @vendor = User.where(id: params[:id]).includes(:user_cities)

    respond_to do |format|
      format.json { render :json => @vendor, :include => [:user_cities, :user_services] }
      format.html
    end
  end
end
