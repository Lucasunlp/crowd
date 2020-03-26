class Api::V1::Persons::Index
  def call(type_person, params)
    if type_person == 'directors'
      query = Director.all
    elsif   type_person == 'producers'
      query = Producer.all
    else
      query = []
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

  def generate_response_representable(persons)
    persons.map do |person|
      ::PersonRepresenter.new(person)
    end
  end
end
