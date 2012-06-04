define [
  'chaplin'
  'views/base/view'
  'text!templates/player.hbs'
], (Chaplin, BaseView, template) ->
  'use strict'

  class PlayerView extends BaseView

    # Save the template string in a prototype property.
    # This is overwritten with the compiled template function.
    # In the end you might want to used precompiled templates.
    template: template
    template = null

    tagName: 'div' # This is not directly a list but contains a list
    id: 'player'
    autoRender: true
    container: 'body .content'

    initialize: ->
        super
        Chaplin.mediator.subscribe 'playClip', @playClip
        Chaplin.mediator.subscribe 'loadClip', @loadClip

    render: =>
        super
        @$el.addClass "player horizontal"

    loadClip: (clip) =>
        @playClip(clip.collection.models[0])

    playClip: (result) =>
        expressInstall = ''
        flashVars = 
            autoPlay : true
        params = 
            allowfullscreen : true
            bgcolor : '#000000'
            wmode : 'transparent'
            allowscriptaccess : 'always'
        attributes = {}
            
        swfobject.embedSWF(result.playerUrl, 'flashObject', 640, 480, 10, expressInstall, flashVars, params,attributes , @flashCallback);

    flashCallback: (options) =>
