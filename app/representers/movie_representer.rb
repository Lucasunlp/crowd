require 'representable/json'

class MovieRepresenter < Representable::Decorator
  include Representable::JSON

  property :id
  property :title
  property :release_year_roman
  property :casting

  nested :director, as: :info_director do
    property :director_id
    property :director_first_name
    property :director_last_name
  end
  nested :producer, as: :info_producer do
    property :producer_id
    property :producer_first_name
    property :producer_last_name
  end
  nested :movie_worker, as: :info_workers do
    collection :actors
    collection :actresses
  end
end
