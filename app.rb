require "pry"
require "active_record"
require "sqlite3"
require "sinatra"
require "sinatra/reloader"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'photo_albums.db')

# So that ActiveRecord explains the SQL it's running in the logs.
ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)

# Models
require_relative "models/photographer.rb"
require_relative "models/photo.rb"
require_relative "models/album.rb"

# Database Setup file
require_relative "database_setup.rb"

require_relative 'controllers/home.rb'
require_relative 'controllers/albums.rb'
require_relative 'controllers/photos.rb'
require_relative 'controllers/photographers.rb'