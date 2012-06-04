require "sinatra/config_file"
require 'sinatra/redis'
require 'json'
require 'haml'

class ClipRemix < Sinatra::Base

    register Sinatra::ConfigFile
    register Sinatra::Redis

    configure do
        set :port, ENV['PORT']
        config_file 'config.yml'
    end

    get '/env' do
        settings.environment.to_s
    end

    get '/' do
            haml :index
    end

    post '/save' do
            #todo check save order of the movies
            clipIndex = redis.incr "ClipIndex"
            clipName = "Clip" + clipIndex.to_s()
            redis.lpush "ClipList", clipName

            params.each do |key,value|
                movieName = clipName+":Movie"+key
                redis.lpush clipName, value.to_json
            end

            content_type :json
            params.to_json
    end

    get '/load' do
            hash = Hash[] 
            clips = redis.lrange "ClipList", 0,-1
            clips.each do |clipName|
                movieArr = Array.new
                movies = redis.lrange clipName, 0,-1
                movies.each do |movieJson|
                    movieArr << JSON.parse(movieJson)
                end
                hash[clipName] = movieArr
            end

            content_type :json
            hash.to_json
    end
end

ClipRemix.run!