# frozen_string_literal: true

module Nexmo
  class Redact < Namespace
    self.authentication = KeySecretQuery

    self.request_body = JSON

    # Redact a specific message.
    #
    # @example
    #   response = client.redact.transaction(id: '00A0B0C0', product: 'sms')
    #
    # @option params [required, String] :id
    #   The transaction ID to redact.
    #
    # @option params [required, String] :product
    #   Product name that the ID provided relates to.
    #
    # @option params [required, String] :type
    #   Required if redacting SMS data.
    #
    # @param [Hash] params
    #
    # @return [Response]
    #
    # @see https://developer.nexmo.com/api/redact#redact-message
    #
    def transaction(params)
      request('/v1/redact/transaction', params: params, type: Post)
    end
  end
end
