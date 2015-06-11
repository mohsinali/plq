class CreateUserCities < ActiveRecord::Migration
  def change
    create_table :user_cities do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
  end
end
