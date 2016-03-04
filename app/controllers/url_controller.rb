class UrlController < ApplicationController

	def index
		@url = Url.new
	end

	def leaderboard
		@list = [1, 2, 3]
	end

	def create
		address = params[:url][:long_url]
		address = "http://" + address unless address[0..3] == "http"
		@url = Url.new(long_url: address)
		if @url.save
    	 	redirect_to url_show_path(@url)
    	else
    		render "index"
    	end
	end

	def show
		@url = Url.find(params[:format])
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
