require 'net/http'

class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    # Get cordinate parameters
    @post.lat, @post.long = geo_cord_params
    @post.save
    redirect_to @post
  end

  private

  def post_params
    params.require(:posts).permit(:title, :text)
  end

  def user_ip_data
    ip_add = request.remote_ip
    base_url = 'http://api.ipstack.com/'
    access_key = ENV['IPSTACK_KEY']

    uri = URI.parse(base_url + ip_add)
    params = { access_key: access_key }

    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    puts "\nOU: "
    puts res.body
    JSON.parse(res.body)
  end

  def geo_cord_params
    ip_data = user_ip_data
    latitude = ip_data['latitude']
    longitude = ip_data['longitude']
    [latitude, longitude]
  end
end
