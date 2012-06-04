define [
  'chaplin'
  'views/base/view'
  'text!templates/result.hbs'
], (Chaplin, BaseView, template) ->
  'use strict'

  class ResultSavedView extends BaseView

    template: template
    template = null

    tagName: 'div'
    autoRender: true
    container: '.save'

    initialize: ->
        super
        @delegate 'click', '', @play

    play: ->
        Chaplin.mediator.publish 'playClip', @model

    render: =>
        super
 
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