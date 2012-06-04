// Generated by CoffeeScript 1.3.3
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['chaplin', 'views/base/view', 'text!templates/result.hbs'], function(Chaplin, BaseView, template) {
  'use strict';

  var ResultView;
  return ResultView = (function(_super) {

    __extends(ResultView, _super);

    function ResultView() {
      this.getTemplateData = __bind(this.getTemplateData, this);

      this.render = __bind(this.render, this);
      return ResultView.__super__.constructor.apply(this, arguments);
    }

    ResultView.prototype.template = template;

    template = null;

    ResultView.prototype.tagName = 'div';

    ResultView.prototype.autoRender = true;

    ResultView.prototype.container = '.clipPlayList';

    ResultView.prototype.initialize = function() {
      ResultView.__super__.initialize.apply(this, arguments);
      return this.delegate('click', '', this.play);
    };

    ResultView.prototype.play = function() {
      return Chaplin.mediator.publish('playClip', this.model);
    };

    ResultView.prototype.render = function() {
      return ResultView.__super__.render.apply(this, arguments);
    };

    ResultView.prototype.getTemplateData = function() {
      var templateData;
      return templateData = {
        id: this.model.id,
        title: this.model.title,
        duration: this.model.duration,
        imageUrl: this.model.imageUrl,
        thumbnailUrl: this.model.thumbnailUrl,
        playerUrl: this.model.playerUrl,
        url: this.model.url,
        movie: this.model.movie
      };
    };

    return ResultView;

  })(BaseView);
});
