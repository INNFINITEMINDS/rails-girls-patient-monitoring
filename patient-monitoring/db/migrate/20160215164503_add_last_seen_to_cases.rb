class AddLastSeenToCases < ActiveRecord::Migration
  def change
    add_column :cases, :last_seen_at, :datetime
  end
end
