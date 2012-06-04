define [
    'chaplin',
    'views/layout',
    'routes'
], (Chaplin, Layout, routes) ->
    'use strict'

    # The application object
    class Application extends Chaplin.Application

        title: 'Hack a Movie'

        initialize: ->
            super

            # Initialize core components
            @initDispatcher()
            @initLayout()

            # Application-specific scaffold
            # @initControllers()

            # Register all routes and start routing
            @initRouter routes

            # Freeze the application instance to prevent further changes
            Object.freeze? this

         initLayout: ->
            @layout = new Layout {@title}
