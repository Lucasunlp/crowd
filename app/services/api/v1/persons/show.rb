class Api::V1::Persons::Show
  def call(type_person, params)
    if type_person == 'directors'
      query = Director.where(id: params) unless params.nil?
    else
      query = Producer.where(id: params) unless params.nil?
    end
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

  def generate_response_representable(person)
    PersonRepresenter.new(person)
  end
end
