class FavoriteCitiesController < ApplicationController
  def new
    @favorite = FavoriteCity.new
  end

  def create
    @favorite = current_user.favorite_cities.build(favorite_params)
    if @favorite.save
      redirect_to root_path, notice: 'Favorite city saved'
    else
      render :new
    end
  end

  def show
    @favorite_city = current_user.favorite_cities.find(params[:id])
    @unit = params[:unit].present? ? params[:unit] : 'f'

    url = "http://api.openweathermap.org/data/2.5/weather?q=#{@favorite_city.city_name}&units=#{@unit == 'f' ? 'imperial' : 'metric'}&APPID=bfdede37a867d92c2fdf92eda5f6ab7c"
    @response = HTTParty.get(url)
    weather_conditions= @response.body
    @current_weather = JSON.parse(weather_conditions)
  end

  def destroy
    @favorite_city = current_user.favorite_cities.find(params[:id])
    @favorite_city.destroy!
    redirect_to root_path, notice: "Favorite city deleted"
  end

  private
  def favorite_params
    params.require(:favorite_city).permit(:city_name, :user_id)
  end
end
