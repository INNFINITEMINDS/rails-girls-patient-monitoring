class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :title
      t.integer :user_id
      t.datetime :date
      t.string :simptoms
      t.string :status
    end
  end
end
