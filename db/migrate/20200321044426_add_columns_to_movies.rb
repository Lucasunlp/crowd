class AddColumnsToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :director_id, :integer
    add_column :movies, :producer_id, :integer
  end
end
