class Api::V1::PersonValidator
  def call(params)
    @errors = []
    correct_id(params) unless params.nil?
    { errors: @errors }
  end

  private

  def correct_id(id)
    @errors << 'Invalid params' unless id.is_a? String
    @errors << 'Invalid params' if id.blank?
  end
end
