require_relative './test'

class NexmoCallsTest < Nexmo::Test
  def calls
    Nexmo::Calls.new(config)
  end

  def calls_uri
    'https://api.nexmo.com/v1/calls'
  end

  def call_uri
    'https://api.nexmo.com/v1/calls/' + call_uuid
  end

  def test_create_method
    params = {
      to: [{type: 'phone', number: '14843331234'}],
      from: {type: 'phone', number: '14843335555'},
      answer_url: ['https://example.com/answer']
    }

    stub_request(:post, calls_uri).with(request(body: params)).to_return(response)

    assert_kind_of Nexmo::Response, calls.create(params)
  end

  def test_list_method
    params = {status: 'completed'}

    stub_request(:get, calls_uri).with(request(query: params)).to_return(response)

    assert_kind_of Nexmo::Calls::ListResponse, calls.list(params)
  end

  def test_get_method
    stub_request(:get, call_uri).with(request).to_return(response)

    assert_kind_of Nexmo::Response, calls.get(call_uuid)
  end

  def test_update_method
    params = {action: 'hangup'}

    stub_request(:put, call_uri).with(request(body: params)).to_return(response)

    assert_kind_of Nexmo::Response, calls.update(call_uuid, params)
  end

  def test_hangup_method
    params = {action: 'hangup'}

    stub_request(:put, call_uri).with(request(body: params)).to_return(response)

    assert_kind_of Nexmo::Response, calls.hangup(call_uuid)
  end

  def test_mute_method
    params = {action: 'mute'}

    stub_request(:put, call_uri).with(request(body: params)).to_return(response)

    assert_kind_of Nexmo::Response, calls.mute(call_uuid)
  end

  def test_unmute_method
    params = {action: 'unmute'}

    stub_request(:put, call_uri).with(request(body: params)).to_return(response)

    assert_kind_of Nexmo::Response, calls.unmute(call_uuid)
  end

  def test_earmuff_method
    params = {action: 'earmuff'}

    stub_request(:put, call_uri).with(request(body: params)).to_return(response)

    assert_kind_of Nexmo::Response, calls.earmuff(call_uuid)
  end

  def test_unearmuff_method
    params = {action: 'unearmuff'}

    stub_request(:put, call_uri).with(request(body: params)).to_return(response)

    assert_kind_of Nexmo::Response, calls.unearmuff(call_uuid)
  end

  def test_transfer_method
    destination = {type: 'ncco', url: ['http://example.org/new-ncco.json']}

    params = {action: 'transfer', destination: destination}

    stub_request(:put, call_uri).with(request(body: params)).to_return(response)

    assert_kind_of Nexmo::Response, calls.transfer(call_uuid, destination: destination)
  end

  def test_stream_method
    assert_kind_of Nexmo::Calls::Stream, calls.stream
  end

  def test_talk_method
    assert_kind_of Nexmo::Calls::Talk, calls.talk
  end

  def test_dtmf_method
    assert_kind_of Nexmo::Calls::DTMF, calls.dtmf
  end
end
