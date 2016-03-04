require 'test_helper'

class ShowTest < ActionController::TestCase

	def setup
		@controller = UrlController.new
		@url = Url.create(long_url: "http://guides.rubyonrails.org/testing.html", count: 1)
	end
	
	test "page loads" do
		get(:show, {'id' => @url.id} )
		assert (response.body).include?('This url has been shortened')
	end

	test "creates a new url" do
		post "create", :url => {
							:long_url => "https://www.google.com/?gws_rd=ssl#q=recursion",
							}
		assert_equal Url.last.long_url, "https://www.google.com/?gws_rd=ssl#q=recursion"
	end

	test "adds http when appropriate" do
		post "create", :url => {
							:long_url => "www.google.com/?gws_rd=ssl#q=recursion",
							}
		assert_equal Url.last.long_url, "http://www.google.com/?gws_rd=ssl#q=recursion"
	end

	test "does not create duplicates" do
		count = @url.count
		url_count = Url.count
		post "create", :url => {
							:long_url => "http://guides.rubyonrails.org/testing.html"
							}
		@url.reload
		assert_equal @url.count, 2
		assert_equal url_count, Url.count
	end

	test "Redirects to long url" do
		get(:make_it_so, {'id' => @url.id} )
		assert (response.body).include?('You are being <a href="http://guides.rubyonrails.org/testing.html">redirected</a>')
	end
end