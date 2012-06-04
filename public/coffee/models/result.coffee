define [
  'models/base/model'
], (Model) ->
  'use strict'

  class Result extends Model

    initialize: (options) ->
        @id = options.id
        @title = options.title
        @duration = options.duration
        @imageUrl = options.image_url
        @thumbnailUrl = options.thumbnail_url
        @playerUrl = options.player_url
        @url = options.url
        
        @movie = 
            id : options.movie.id
            name : options.movie.name