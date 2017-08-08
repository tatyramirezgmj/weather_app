class FlickrApi
  include HTTParty

  def self.get_city_picture(city_name)
    url ="https://api.flickr.com/services/rest/?method=flickr.test.echo&name=value&api=185778130376eea7bfb8c9b5623e3bb3"
    @response = HTTParty.get(url)
    city_picture= @response.body
    return JSON.parse(city_picture)
  end
end
