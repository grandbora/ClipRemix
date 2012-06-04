define [
  'chaplin'
  'views/base/view'
  'views/resultSaved'
  'text!templates/save.hbs'
], (Chaplin, BaseView, ResultSavedView , template) ->
  'use strict'

  class SaveView extends BaseView

    # Save the template string in a prototype property.
    # This is overwritten with the compiled template function.
    # In the end you might want to used precompiled templates.
    template: template
    template = null

    tagName: 'div' # This is not directly a list but contains a list
    id: 'save'
    autoRender: true
    container: 'body .content'

    initialize: (options) ->
        super
        @resultList = options.resultList
        @makeDroppable()
        @delegate 'drop', '', @itemDropped
        @delegate 'click', '.control .saveButton', @saveList
        @modelBind 'add', @addResult
        @modelBind 'add', @showSave

    render: =>
        super
        @$el.addClass "save horizontal"

    makeDroppable: =>
        @$el.droppable 
            activeClass: "ui-state-hover"
            hoverClass: "ui-state-active"

    itemDropped: (e,ui) =>
        id = ui.draggable.attr 'id'
        result = @resultList.getByCid(id)
        @resultList.remove(result)
        @collection.add(result)

    addResult: (result, saveList, index) =>
         new ResultSavedView 
                model : result
                id : result.cid
                className : 'result'

    showSave: (result, saveList, index) =>
        drag = @$el.find '.control .dragButton'
        drag.hide()
        save = @$el.find '.control .saveButton'
        save.show()

    saveList: () =>
        @collection.save()