require 'representable/json'

class PersonRepresenter < Representable::Decorator
  include Representable::JSON

  property :id
  property :first_name
  property :last_name
end
