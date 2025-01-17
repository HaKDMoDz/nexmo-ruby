require_relative './test'

class NexmoRedactTest < Nexmo::Test
  def redact
    Nexmo::Redact.new(config)
  end

  def test_transaction_method
    uri = 'https://api.nexmo.com/v1/redact/transaction'

    headers = {'Content-Type' => 'application/json'}

    params = {id: '00A0B0C0', product: 'sms'}

    stub_request(:post, uri).with(query: api_key_and_secret, headers: headers, body: params).to_return(status: 204)

    assert_kind_of Nexmo::Response, redact.transaction(params)
  end
end
