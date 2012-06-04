define [
    'chaplin'
    'models/base/collection'
    'models/clip'
    'models/resultList'
], (Chaplin, Collection, Clip, ResultList) ->
  'use strict'

  class ClipList extends Collection

    model: Clip

    initialize: ->
      super

    load: () =>
        $.ajax '/load',
            type: 'GET'
            dataType: 'json'
            error: (jqXHR, textStatus, errorThrown) =>
                alert 'some kind of error somewhere, useful info ehh (LOAD)?'
            success: (data, textStatus, jqXHR) =>
                _.each data, (val, key) =>
                    resultList = new ResultList val
                    @add
                        name : key
                        collection : resultList