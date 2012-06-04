define [
  'chaplin'
  'views/base/view'
  'text!templates/result.hbs'
], (Chaplin, BaseView, template) ->
  'use strict'

  class ResultView extends BaseView

    # Save the template string in a prototype property.
    # This is overwritten with the compiled template function.
    # In the end you might want to used precompiled templates.
    template: template
    template = null

    tagName: 'div'
    autoRender: true
    container: '.results'

    initialize: ->
        super
        @delegate 'click', '', @play
        @makeDraggable()

    play: ->
        Chaplin.mediator.publish 'playClip', @model

    render: =>
        super
        @$el.addClass "result horizontal"
 
    getTemplateData: =>
        templateData =
            id : @model.id
            title : @model.title
            duration : @model.duration
            imageUrl : @model.imageUrl
            thumbnailUrl : @model.thumbnailUrl
            playerUrl : @model.playerUrl
            url : @model.url
            movie : @model.movie

    makeDraggable: =>
        @$el.draggable 
            revert: "invalid"