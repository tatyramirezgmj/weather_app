class FavoriteCitiesController < ApplicationController
  def new
    @favorite = FavoriteCity.new
  end

  def create
    @favorites = current_user.favorite_cities.build(favorite_params)
    if @favorites.save
      redirect_to root_path, notice: 'Favorite city saved'
    else
      render :new
    end
  end

  def show
    @favorite_city = current_user.favorite_cities.find(params[:id])
    url=("http://api.openweathermap.org/data/2.5/weather?q=#{@favorite_city.city_name}&APPID=bfdede37a867d92c2fdf92eda5f6ab7c")
    @response = HTTParty.get(url)
    weather_conditions= @response.body
    @current_weather = JSON.parse(weather_conditions)
  end

  private
  def favorite_params
    params.require(:favorite_city).permit(:city_name, :user_id)
  end
end
