require 'test_helper'

class LeaderboardTest < ActionController::TestCase

  def setup
    @controller = UrlController.new
  end
  
  test "page loads" do
    get 'leaderboard'
    assert (response.body).include?('These are the top 100 shortened urls')
  end
end