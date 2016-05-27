class PagesController < ApplicationController

  def weather
    url = 'https://api.forecast.io/forecast/a65d37c3f4845b5e43e50756c1ed1240/41.9022,-87.6726'
    fh = open(url)
    data = fh.read()
    render json: JSON.parse(data)
  end

  def show
    render params[:page] || 'geo'
  end

end
