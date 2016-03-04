class AddColumnCount < ActiveRecord::Migration
  def change
  	add_column :urls, :count, :integer
  end
end
