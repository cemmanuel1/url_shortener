get '/' do
  # Look in app/views/index.erb
  @new_url = Url.new
  erb :index
end

post '/url' do
  @long_url = params[:long_url]
  @new_url = Url.find_or_create_by_long_url(long_url:  @long_url)
  if @new_url.valid?
    @short_url =  'http://localhost:9393/' + @new_url.short_url
    erb :new_url
  else
    erb :index
  end
end

get '/:short_url' do


  p "Short_url: "
  p get_url = params[:short_url]
  p "Short url from DB: "
  new_url = Url.find_by_short_url(get_url)
  p new_url

  new_url.counter += 1
  p "Counter: #{new_url.counter}"
  new_url.save
  redirect new_url.long_url
end