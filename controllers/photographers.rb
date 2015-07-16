# This pulls from the main page, and sends the user to the photographer_main page.
get '/photographers/photographer_main' do
  erb :'/photographers/photographer_main'
end

# form for user to enter information to add photographer
get "/photographer_add_form" do
  erb :"/photographers/photographer_add_form"
end

get '/photographers/photographer_add' do
  # new_photographer_id is the Integer returned from the add method
  @new_photographer_id = Photographer.add(params)
  erb :"/success/data_added"
end

get '/photographers/photographer_change' do
  @photographer = Photographer.find(params["id"].to_i)
  erb :"/photographers/photographer_change"
end

get "/photographer_update" do
  erb :"/photographers/photographer_update"
end

get "/photographer_update/save" do
  @photographer = Photographer.find(params['id'].to_i)
  @photographer.date = params["date"]
  @photographer.name = params["name"]
  @photographer.description = params["description"]
  @photographer.github_link = params["github_link"]
  @photographer.blog_link = params["blog_link"]
  if @photographer.save
    erb :"/success/data_changed"
  else
    @error = true
    erb :"/photographers/photographer_update"
  end
end

get '/photographer_delete' do
  erb :"/photographers/photographer_delete"
end

get "/photographer_deleter" do
  @specific_photographer = Photographer.find(params["id"])
  @specific_photographer.delete
  erb :"/success/data_deleted"
end

get "/photographer_view" do
  @photographer = Photographer.all
  erb :"/photographers/photographer_view"
end
