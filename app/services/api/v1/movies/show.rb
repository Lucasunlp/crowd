class Api::V1::Movies::Show
  def call(params)
    query = Movie.where(id: params) unless params.nil?
    construct(query)
  rescue StandardError
    raise ArgumentError, "Unknown status #{status}."
  end

  private

  def construct(query)
    data = generate_response_representable(query.first) unless query.empty?
    Api::V1::StandardResponse.new.call(
      status: 'ok',
      data: data
    )
  end

  def generate_response_representable(movie)
    MovieRepresenter.new(movie)
  end
end
