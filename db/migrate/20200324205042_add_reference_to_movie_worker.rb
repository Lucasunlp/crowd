class AddReferenceToMovieWorker < ActiveRecord::Migration[5.2]
  def change
    add_reference :movie_workers, :movie, foreign_key: true
  end
end
