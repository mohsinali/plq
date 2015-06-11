class RemoveColumnServiceFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :service
  end
end
