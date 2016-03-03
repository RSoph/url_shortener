class UrlController < ApplicationController

	def index
		@url = Url.new
	end

	def create
		@url = Url.new(long_url: params[:url][:long_url])

		if @url.save
     	redirect_to url_show_path(@url)
    	else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render "index"
    	end
	end

	def show
		@url = Url.find(params[:format])
	end

	private

	def url_params
		params.require(:url).permit(:long_url)
	end
end
