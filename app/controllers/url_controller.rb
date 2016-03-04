class UrlController < ApplicationController

	def index
		@url = Url.new
	end

	def leaderboard
		@list = Url.order(count: :desc)[0..99]
	end

	def create
		address = params[:url][:long_url]
		address = "http://" + address unless address[0..3] == "http"
		@url = Url.find_by(long_url: address)
		@url ||= Url.new(long_url: address)
		@url.count ||= 0
		@url.count += 1
		if @url.save
    	 	redirect_to "/url/show/#{@url.id}"
    	else
    		render "index"
    	end
	end

	def show
		@url = Url.find(params[:id])
	end

	def make_it_so
		@url = Url.find(params[:id])
		@address = @url.long_url
		redirect_to @address
	end

	private

	def url_params
		params.require(:url).permit(:long_url)
	end
end
