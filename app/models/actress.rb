class Actress < Person
  has_many :movies, through: :movie_worker
end
