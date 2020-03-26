class Api::V1::PersonsController < ApiController
  # GET /api/v1/persons/directors
  def directors
    if validate_params(params).empty?
      response_formater Api::V1::Persons::Index.new.call('directors', params)
    else
      error_response('Wrong Params')
    end
  end

  # GET /api/v1/persons/directors/1
  # GET /api/v1/persons/producers/1
  def show
    if validate_params(params).empty?
      request.path.include?('producers') ? (response_formater Api::V1::Persons::Show.new.call('producers', params[:id])) : (response_formater Api::V1::Persons::Show.new.call('directors', params[:id]))
    else
      error_response('Wrong Params')
    end
  end


  # GET /api/v1/persons/producers
  def producers
    if validate_params(params).empty?
      response_formater Api::V1::Persons::Index.new.call('producers', params)
    else
      error_response('Wrong Params')
    end
  end

  private

  def validate_params(params)
    check = Api::V1::PersonValidator.new.call(params[:id])
    check[:errors]
  end

  def error_response(errors)
    render status: 404, json: {
      status: 'error',
      notifications: errors
    }.to_json
  end
end
