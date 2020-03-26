class Api::V1::Movies::Index
  def call(params)
    if params[:movie_id].nil?
      query = Movie.all
    else
      query = Movie.where(movie: params[:movie_id])
    end
    construct(query)
  end

  private

  def construct(query)
    data = generate_response_representable(query)
    Api::V1::StandardResponse.new.call(
      status: 'ok',
      data: data
    )
  end

  def generate_response_representable(movies)
    movies.map do |movie|
      ::MovieRepresenter.new(movie)
    end
  end
end
