require 'test_helper'

class ShowTest < ActionController::TestCase

  def setup
    @controller = UrlController.new
    @url = Url.first
  end
  
  test "page loads" do
	get(:show, {'id' => @url.id} )
	# binding.pry
    assert (response.body).include?('This url has been shortened')
  end
end