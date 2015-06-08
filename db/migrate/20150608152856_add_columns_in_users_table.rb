class AddColumnsInUsersTable < ActiveRecord::Migration
  def change
  	add_column :users, :location, :string
  	add_column :users, :service, :string
  	add_column :users, :tier, :string
  	add_column :users, :social_links, :string
  	add_column :users, :description, :text
  end
end
