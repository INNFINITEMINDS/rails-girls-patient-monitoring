class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
    	t.belongs_to :case
    	t.belongs_to :doctor
    	t.text :content

    	t.timestamps null: false
    end
  end
end
