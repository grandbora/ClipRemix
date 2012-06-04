define [
  'chaplin',
  'models/clipList'
  'views/clipList'
  'views/clipPlayList'
  'views/player'
], (Chaplin, ClipList, ClipListView, ClipPlayListView, PlayerView) ->
  'use strict'

  class HomeController extends Chaplin.Controller

    title: ''
    historyURL: (params) -> ""

    index: (params) =>
        @clipList = new ClipList()

        @clipPlayListView = new ClipPlayListView
            id : "clipPlayList"
            className : "clipPlayList horizontal"
            
        @playerView = new PlayerView

        @clipView = new ClipListView 
            collection : @clipList
            id : "clip"
            className : "clipList"
        
        @clipList.load()