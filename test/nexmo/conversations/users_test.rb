require_relative '../test'

class Nexmo::Conversations::UsersTest < Nexmo::Test
  def users
    Nexmo::Conversations::Users.new(config)
  end

  def users_uri
    'https://api.nexmo.com/beta/users'
  end

  def user_uri
    'https://api.nexmo.com/beta/users/' + user_id
  end

  def params
    {display_name: 'My User Name'}
  end

  def test_create_method
    stub_request(:post, users_uri).with(request(body: params)).to_return(response)

    assert_kind_of Nexmo::Response, users.create(params)
  end

  def test_list_method
    stub_request(:get, users_uri).with(request).to_return(response)

    assert_kind_of Nexmo::Response, users.list
  end

  def test_get_method
    stub_request(:get, user_uri).with(request).to_return(response)

    assert_kind_of Nexmo::Response, users.get(user_id)
  end

  def test_update_method
    stub_request(:put, user_uri).with(request(body: params)).to_return(response)

    assert_kind_of Nexmo::Response, users.update(user_id, params)
  end

  def test_delete_method
    stub_request(:delete, user_uri).with(request).to_return(response)

    assert_kind_of Nexmo::Response, users.delete(user_id)
  end
end
