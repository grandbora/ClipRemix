define [
  'chaplin'
  'views/base/view'
  'views/result'
  'text!templates/create.hbs'
], (Chaplin, BaseView, ResultView, template) ->
  'use strict'

  class CreateView extends BaseView

    # Save the template string in a prototype property.
    # This is overwritten with the compiled template function.
    # In the end you might want to used precompiled templates.
    template: template
    template = null

    tagName: 'div' # This is not directly a list but contains a list
    id: 'create'
    autoRender: true
    container: 'body .content'

    initialize: ->
        super # Will render the list itself and all items
        @delegate 'keyup', '.search input', @collection.fetch
        @modelBind 'reset', @renderResults
        @modelBind 'remove', @removeResult

    render: ->
        super
        @renderResults

    renderResults: ->
        resultContainer = @$el.find '.results'
        resultContainer.empty()
        _.each @collection.models , (result) -> 
            new ResultView 
                model : result
                id : result.cid
    
    removeResult: (result, resultList, index)->
        resultEl = @$el.find '.results #'+result.cid
        resultEl.remove()