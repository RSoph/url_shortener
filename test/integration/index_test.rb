require 'test_helper'

class IndexTest < ActionController::TestCase

  def setup
    @controller = UrlController.new

  end
  
  test "page loads" do
    get 'index'
    assert (response.body).include?('Welcome')
  end
end