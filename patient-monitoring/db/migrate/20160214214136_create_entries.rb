class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.integer :case_id
      t.integer :user_id
      t.datetime :entry_date
      t.string :entry_type
      t.string :content
    end
  end
end
