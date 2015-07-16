# This pulls from the main page, and sends the user to the album_main page.
get '/albums/album_main' do
  erb :'/albums/album_main'
end

# form for user to enter information to add album
get "/album_add_form" do
  erb :"/albums/album_add_form"
end

get '/albums/album_add' do
  # new_album_id is the Integer returned from the add method
  @new_album_id = Album.add(params)
  erb :"/success/data_added"
end

get '/albums/album_change' do
  @album = Album.find(params["id"].to_i)
  erb :"/albums/album_change"
end

get "/album_update" do
  erb :"/albums/album_update"
end

get "/album_update/save" do
  @album = Album.find(params['id'].to_i)
  @album.date = params["date"]
  @album.name = params["name"]
  @album.description = params["description"]
  @album.github_link = params["github_link"]
  @album.blog_link = params["blog_link"]
  if @album.save
    erb :"/success/data_changed"
  else
    @error = true
    erb :"/albums/album_update"
  end
end

get '/album_delete' do
  erb :"/albums/album_delete"
end

get "/album_deleter" do
  @specific_album = Album.find(params["id"])
  @specific_album.delete
  erb :"/success/data_deleted"
end

get "/album_view" do
  @album = Album.all
  erb :"/albums/album_view"
end
