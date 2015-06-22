class VisitorsController < ApplicationController
  layout 'home'

  def index
  	@q = User.with_role(:agent).ransack(params[:q])
    # file = "/home/mohsin/Project_Docs/PLQ/iso3166.csv"
    # CSV.foreach(file) do |row|
    #   # binding.pry
    #   Country.create(name: row[1], code: row[0])
    # end
  end
end
