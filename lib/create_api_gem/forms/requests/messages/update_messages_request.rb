class UpdateMessagesRequest < APIRequest
  def initialize(token, form, messages)
    request(
      method: :put,
      url: "#{APIConfig.api_request_url}/forms/#{form.id}/messages",
      headers: {
        'Typeform-Request-Id' => DataGenerator.uuid,
        'Authorization' => "Bearer #{token}"
      },
      payload: messages.payload
    )
  end

  def success?
    @response.code == 204
  end

  def payment_required?
    @response.code == 402
  end
end
