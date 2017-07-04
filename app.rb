require 'sinatra'
require 'sinatra/reloader' if development?
require 'liquid'
require 'dotenv'
require 'redis'
require 'storyblok'

Dotenv.load

current_dir = Dir.pwd

Dir["#{current_dir}/app/models/*.rb"].each { |file| require file }
Dir["#{current_dir}/app/libs/*.rb"].each { |file| require file }
Dir["#{current_dir}/app/drops/*.rb"].each { |file| require file }
Dir["#{current_dir}/app/blocks/*.rb"].each { |file| require file }
Dir["#{current_dir}/app/helpers/*.rb"].each { |file| require file }

configure do
  set :protection, :except => :frame_options
end

get '*' do
  logger = Logger.new(STDOUT)
  slug = params['splat'].join('/')
  slug = slug[1..-1]
  slug = 'demo' if slug == '' # Set a default slug for the homepage

  Storyblok::Cache.client = Redis.new(:url => 'redis://localhost:6379')
  Storyblok::App.client = Storyblok::Client.new(
    logger: logger,
    cache_version: Time.now.to_i,
    token: 'wANpEQEsMYGOwLxwXQ76Ggtt',
    version: 'draft',
    api_url: 'api.storyblok.com',
    secure: ENV['RACK_ENV'] == 'production' ? true : false
  )
  Storyblok::App.links = Link.all

  story = Story.find(slug)
  template_path = 'page.liquid'

  assigns = {"story" => story, "params" => Storyblok::ParamsDrop.new(params)}

  Liquid::Template.file_system = Liquid::LocalFileSystem.new("#{current_dir}/views/components")

  liquid :page, :locals => assigns
end


