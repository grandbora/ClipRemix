define [
    'chaplin'
    'models/base/collection'
    'models/result'
], (Chaplin, Collection, Result) ->
  'use strict'

  class ResultList extends Collection

    model: Result

    initialize: ->
      super

    fetch: (e) =>
        key = ($ e.srcElement).val()
        $.ajax 'http://jsonclips.herokuapp.com/search?q='+ key,
            type: 'GET'
            dataType: 'jsonp'
            error: (jqXHR, textStatus, errorThrown) =>
                alert 'some kind of error somewhere, useful info ehh?'
            success: (data, textStatus, jqXHR) =>
                @reset $.parseJSON(data)
    
    save: () =>
        data = {}
        dataIndex = 0
        _.each @models , (model) -> 
            data[dataIndex.toString()] = model.attributes
            dataIndex++

        $.ajax '/save',
            type: 'post'
            dataType: 'json'
            data : data
            error: (jqXHR, textStatus, errorThrown) =>
                alert 'some kind of error somewhere, useful info ehh?'
            success: (data, textStatus, jqXHR) =>
                Chaplin.mediator.publish '!startupController', 'home', 'index'

