define [
  'models/base/model'
], (Model) ->
  'use strict'

  class Clip extends Model

    initialize: (options) ->
        @name = options.name
        @collection = options.collection