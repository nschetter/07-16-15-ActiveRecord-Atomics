# This pulls from the main page, and sends the user to the controller_main page.
get '/controllers/controller_main' do
  erb :'/controllers/controller_main'
end

# form for user to enter information to add controller
get "/controller_add_form" do
  erb :"/controllers/controller_add_form"
end

get '/controllers/controller_add' do
  # new_controller_id is the Integer returned from the add method
  @new_controller_id = Controller.add(params)
  erb :"/success/data_added"
end

get '/controllers/controller_change' do
  @controller = Controller.find(params["id"].to_i)
  erb :"/controllers/controller_change"
end

get "/controller_update" do
  erb :"/controllers/controller_update"
end

get "/controller_update/save" do
  @controller = Controller.find(params['id'].to_i)
  @controller.date = params["date"]
  @controller.name = params["name"]
  @controller.description = params["description"]
  @controller.github_link = params["github_link"]
  @controller.blog_link = params["blog_link"]
  if @controller.save
    erb :"/success/data_changed"
  else
    @error = true
    erb :"/controllers/controller_update"
  end
end

get '/controller_delete' do
  erb :"/controllers/controller_delete"
end

get "/controller_deleter" do
  @specific_controller = Controller.find(params["id"])
  @specific_controller.delete
  erb :"/success/data_deleted"
end

get "/controller_view" do
  @controller = Controller.all
  erb :"/controllers/controller_view"
end
Controller