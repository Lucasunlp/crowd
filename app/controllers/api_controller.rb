class ApiController < ActionController::API
  # include ActionController::HttpAuthentication::Token::ControllerMethods

  def response_formater(response)
    render json: response, status: response[:code]
  end
end
