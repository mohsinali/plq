class CreateLanguagesUsersJoinTable < ActiveRecord::Migration
  def change
	create_table(:languages_users, :id => false) do |t|
	  t.references :language
	  t.references :user
	end

  add_index :languages_users, [:language_id, :user_id]
  end
end
