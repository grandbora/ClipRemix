define [
  'chaplin'
  'views/base/view'
  'views/resultPlayList'
], (Chaplin, BaseView, ResultView) ->
  'use strict'

  class ClipPlayListView extends BaseView

    template: ""
    template = null

    tagName: 'div'
    autoRender: true
    container: '.content'

    initialize: ->
        super
        Chaplin.mediator.subscribe 'loadClip', @loadClip

    render: =>
        super

    loadClip: (clip) =>
        # @$el.empty()
        # dirty hack
        $('.clipPlayList').empty()

        _.each clip.collection.models , (result) -> 
            new ResultView 
                model : result
                id : "playList_" + result.cid
                className : "playListClip"