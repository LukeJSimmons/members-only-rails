class RemoveClubIdFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_reference :users, :club, null: false, foreign_key: true
  end
end
