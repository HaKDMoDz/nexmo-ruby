require_relative '../test'

class Nexmo::Calls::TalkTest < Nexmo::Test
  def talk
    Nexmo::Calls::Talk.new(config)
  end

  def uri
    'https://api.nexmo.com/v1/calls/' + call_uuid + '/talk'
  end

  def test_start_method
    params = {text: 'Hello'}

    stub_request(:put, uri).with(request(body: params)).to_return(response)

    assert_kind_of Nexmo::Response, talk.start(call_uuid, params)
  end

  def test_stop_method
    stub_request(:delete, uri).with(request).to_return(response)

    assert_kind_of Nexmo::Response, talk.stop(call_uuid)
  end
end
