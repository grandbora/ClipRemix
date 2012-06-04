define [
  'chaplin'
  'views/base/view'
  'views/clip'
], (Chaplin, BaseView, ClipView) ->
  'use strict'

  class ClipListView extends BaseView

    template: ""
    template = null

    tagName: 'div'
    autoRender: true
    container: '.content'

    initialize: ->
        super
        @modelBind 'add', @clipAdded

    render: =>
        super

    clipAdded: (clip, clipList, index)=>
        new ClipView
            model :clip
            id : clip.cid
            className : "clip horizontal"