class ChangeTypeProducts < ActiveRecord::Migration
  def change
	  change_column :products, :size, :string
	  change_column :products, :weight, :string
  end
end
