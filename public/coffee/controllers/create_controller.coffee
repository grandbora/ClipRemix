define [
    'chaplin'
    'models/resultList'
    'views/create'
    'views/save'
    'views/player'
], (Chaplin, ResultList, CreateView, SaveView, PlayerView) ->
  'use strict'

  class CreateController extends Chaplin.Controller

    historyURL: (params) -> "create"

    index: (params) ->
        @resultList = new ResultList()
        @saveClips = new ResultList()

        @saveView = new SaveView 
            collection : @saveClips
            resultList : @resultList

        @playerView = new PlayerView
        @createView = new CreateView collection: @resultList
