class Actor < Person
  has_many :movies, through: :movie_worker
end
