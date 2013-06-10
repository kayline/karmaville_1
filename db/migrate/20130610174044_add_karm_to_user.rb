class AddKarmToUser < ActiveRecord::Migration
  def change
  	add_column :users, :karma_count, :integer
  end
end
