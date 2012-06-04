
require.config 
    baseUrl: '/js/'
    
    paths: 
        domReady : 'vendor/domReady-1.0.8'
        order : 'vendor/order-1.0.8'
        text : 'vendor/text-1.0.8'
        underscore: 'vendor/underscore-1.3.2'
        backbone: 'vendor/backbone-0.9.2'
        chaplin: 'vendor/chaplin'
        handlebars: 'vendor/handlebars-1.0.0.beta.6'
        jquery: 'vendor/jquery-1.7.2.min'
        jqueryUI: 'vendor/jquery-ui-1.8.20.custom.min'
        swfobject: 'vendor/swfobject'

    waitSeconds: 1
    # urlArgs: 'bust=' +  (new Date()).getTime() #todo make env specific
  
require ['domReady','app', 'jquery', 'jqueryUI','underscore', 'swfobject'], (domReady, Application, jquery, jqueryUI,underscore, swfobject)->
    'use strict'
    domReady ->
        app = new Application()
        app.initialize()