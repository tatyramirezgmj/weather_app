class FavoriteCitiesController < ApplicationController
  def new
    @favorite = FavoriteCity.new
  end

  def create
    @favorite = current_user.favorite_cities.build(favorite_params)
    if @favorite.save
      redirect_to dashboard_path, notice: 'Favorite city saved'
    else
      render :new
    end
  end

  def show
    @favorite_city = current_user.favorite_cities.find(params[:id])
    @unit = params[:unit].present? ? params[:unit] : 'C'
    @current_weather = WeatherApi.get_weather(@favorite_city.city_name, @unit)
  end

  def destroy
    @favorite_city = current_user.favorite_cities.find(params[:id])
    @favorite_city.destroy!
    redirect_to dashboard_path, notice: "Favorite city deleted"
  end

  private
  def favorite_params
    params.require(:favorite_city).permit(:city_name, :user_id)
  end
end
