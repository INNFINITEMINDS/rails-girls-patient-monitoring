class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
    	t.belongs_to :doctor
    	t.belongs_to :patient
    	t.string :title
    	t.text :simptoms
    	t.string :status

    	t.timestamps null: false
    end
  end
end
