class CreateMovieWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_workers do |t|
      t.references :actress, foreign_key: true
      t.references :actor, foreign_key: true

      t.timestamps
    end
  end
end
