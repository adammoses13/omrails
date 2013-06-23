class AddAbilityToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :ability, :string
  end
end
