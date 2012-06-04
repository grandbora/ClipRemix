define [
  'chaplin'
  'views/base/view'
  'text!templates/clip.hbs'
], (Chaplin, BaseView, template) ->
  'use strict'

  class ClipView extends BaseView

    template: template
    template = null

    tagName: 'div'
    autoRender: true
    container: '.clipList'

    initialize: ->
        super
        @delegate 'click', '', @loadClip

    render: =>
        super

    loadClip: =>
        Chaplin.mediator.publish 'loadClip', @model