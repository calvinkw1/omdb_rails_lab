class MoviesController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def search
    query = params[:q]
    request = Typhoeus::Request.new(
      "http://www.omdbapi.com/?",
      method: :get,
      params: { s: query },
    )
    request.run
    movies = JSON.parse(request.response.body)
    @movies = movies["Search"]
    # binding.pry
    # render :index
    respond_to do |format|
      format.html
      format.json { render json: @movies}
    end
  end

end


# request = Typhoeus::Request.new(
#   "www.example.com",
#   method: :get,
#   params: {s: "True Grit"}
# )
# request.run
# puts "body of the response is #{request.response.body}"