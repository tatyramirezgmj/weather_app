class WeatherApi
  include HTTParty

  def self.get_weather(city_name, unit)
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{city_name}&units=#{unit == 'f' ? 'imperial' : 'metric'}&APPID=bfdede37a867d92c2fdf92eda5f6ab7c"
    @response = HTTParty.get(url)
    weather_conditions= @response.body
    return JSON.parse(weather_conditions)
  end
end
