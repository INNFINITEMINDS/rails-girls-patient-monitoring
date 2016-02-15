class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :type, :string
    add_column :users, :birthday, :datetime
    add_column :users, :height, :string
    add_column :users, :weight, :string
  end
end
