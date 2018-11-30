require 'net/http'

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    geo_cord_params
    weather_params
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text,)
  end

  def user_ip_data
    # ip_add = request.remote_ip
    ip_add = '177.157.104.63'
    base_url = 'http://api.ipstack.com/'
    access_key = ENV['IPSTACK_KEY']

    uri = URI.parse(base_url + ip_add)
    params = { access_key: access_key }

    uri.query = URI.encode_www_form(params)
    Net::HTTP.get_response(uri)
  end

  def user_weather_data
    base_url = 'http://api.openweathermap.org/data/2.5/weather?'
    uri = URI.parse(base_url)

    access_key = ENV['OPEN_WEATHER_KEY']
    params = { appid: access_key, lat: @post.latitude, lon: @post.longitude }
    uri.query = URI.encode_www_form(params)
    Net::HTTP.get_response(uri)
  end

  def geo_cord_params
    ip_resp = user_ip_data
    if ip_resp.is_a? Net::HTTPSuccess
      ip_data = JSON.parse(ip_resp.body)
    else
      return { 'error' => 'Error with IP Stack API' }
    end

    @post.latitude = ip_data['latitude']
    @post.longitude = ip_data['longitude']
    @post.country_name = ip_data['country_name']
    @post.region_name = ip_data['region_name']
    @post.region_code = ip_data['region_code']
    @post.country_code = ip_data['country_code']
    @post.country_name = ip_data['country_name']
  end

  def weather_params
    weather_resp = user_weather_data
    if weather_resp.is_a? Net::HTTPSuccess
      weather_data = JSON.parse(weather_resp.body)
    else
      return { 'error' => 'Error with Open Weather Map API' }
    end
    weather = weather_data['weather'][0]
    weather_main = weather_data['main']

    @post.weather_description = weather['description']
    @post.weather_icon = weather['icon']
    @post.temp = weather_main['temp']
    @post.temp_min = weather_main['temp_min']
    @post.temp_max = weather_main['temp_max']
  end
end
