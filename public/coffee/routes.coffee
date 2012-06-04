define ->
  'use strict'

  # The routes for the application. This module returns a function.
  # `match` is match method of the Router
  (match) ->
    match '', 'home#index'
    match 'create', 'create#index'
    match 'movie/:id', 'movie#show'
