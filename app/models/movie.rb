class Movie < ApplicationRecord
  belongs_to :producer
  belongs_to :director
  has_many :actors, through: :movie_worker
  has_many :actresses, through: :movie_worker

  validates :title, :release_year, presence: true

  # source https://codereview.stackexchange.com/questions/33170/roman-numeral-converter-in-ruby
  DIGITS = {
    1000 => 'M',
    900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C',
    90 => 'XC', 50 => 'L', 40 => 'XL', 10 => 'X',
    9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I'
  }

  def release_year_roman
    return if release_year.nil?
    num = release_year.year
    romanize(num)
  end

  def director_id
    director.id
  end

  def director_first_name
    director.first_name
  end

  def director_last_name
    director.last_name
  end

  def producer_id
    producer.id
  end

  def producer_first_name
    producer.first_name
  end

  def producer_last_name
    producer.last_name
  end

  def casting
    [actresses, actors]
  end

  def actresses
    query = MovieWorker.where(movie_id: id)
    query.map{ |actress| Actress.find actress.actress_id }
  end

  def actors
    query = MovieWorker.where(movie_id: id)
    query.map{ |actor| Actor.find actor.actor_id }
  end

  private

  def romanize(num)
    DIGITS.keys.each_with_object('') do |key, str|
      nbr, num = num.divmod(key)
      str << DIGITS[key] * nbr
    end
  end
end
