class CreateUserServices < ActiveRecord::Migration
  def change
    create_table :user_services do |t|
    	t.string :name
      t.references :user

      t.timestamps
    end
  end
end
