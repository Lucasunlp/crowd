class Api::V1::MoviesController < ApiController
  # GET /api/v1/movies
  def index
    if validate_params(params).empty?
      response_formater Api::V1::Movies::Index.new.call(params)
    else
      error_response('Wrong Params')
    end
  end

  # GET /api/v1/movies/1
  def show
    if validate_params(params).empty?
      response_formater Api::V1::Movies::Show.new.call(params[:id])
    else
      error_response('Wrong Params')
    end
  end

  private

  def validate_params(params)
    check = Api::V1::MovieValidator.new.call(params[:id])
    check[:errors]
  end

  def error_response(errors)
    render status: 404, json: {
      status: 'error',
      notifications: errors
    }.to_json
  end
end
