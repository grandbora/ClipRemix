// Generated by CoffeeScript 1.3.3
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['chaplin', 'models/base/collection', 'models/result'], function(Chaplin, Collection, Result) {
  'use strict';

  var ResultList;
  return ResultList = (function(_super) {

    __extends(ResultList, _super);

    function ResultList() {
      this.save = __bind(this.save, this);

      this.fetch = __bind(this.fetch, this);
      return ResultList.__super__.constructor.apply(this, arguments);
    }

    ResultList.prototype.model = Result;

    ResultList.prototype.initialize = function() {
      return ResultList.__super__.initialize.apply(this, arguments);
    };

    ResultList.prototype.fetch = function(e) {
      var key,
        _this = this;
      key = ($(e.srcElement)).val();
      return $.ajax('http://jsonclips.herokuapp.com/search?q=' + key, {
        type: 'GET',
        dataType: 'jsonp',
        error: function(jqXHR, textStatus, errorThrown) {
          return alert('some kind of error somewhere, useful info ehh?');
        },
        success: function(data, textStatus, jqXHR) {
          return _this.reset($.parseJSON(data));
        }
      });
    };

    ResultList.prototype.save = function() {
      var data, dataIndex,
        _this = this;
      data = {};
      dataIndex = 0;
      _.each(this.models, function(model) {
        data[dataIndex.toString()] = model.attributes;
        return dataIndex++;
      });
      return $.ajax('/save', {
        type: 'post',
        dataType: 'json',
        data: data,
        error: function(jqXHR, textStatus, errorThrown) {
          return alert('some kind of error somewhere, useful info ehh?');
        },
        success: function(data, textStatus, jqXHR) {
          return Chaplin.mediator.publish('!startupController', 'home', 'index');
        }
      });
    };

    return ResultList;

  })(Collection);
});