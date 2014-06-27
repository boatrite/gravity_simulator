// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.Universe = (function() {
    function Universe(width, height) {
      this.width = width;
      this.height = height;
      this.drawText = __bind(this.drawText, this);
      this.drawBackground = __bind(this.drawBackground, this);
      this.drawAll = __bind(this.drawAll, this);
      this.updateAll = __bind(this.updateAll, this);
      this.tick = __bind(this.tick, this);
      this.addEntity = __bind(this.addEntity, this);
      this.entities = [];
    }

    Universe.prototype.addEntity = function(entity) {
      return this.entities.push(entity);
    };

    Universe.prototype.tick = function(dt, context) {
      this.updateAll(dt);
      this.drawAll(context);
      return this.drawText(context, "dt = " + dt + "ms");
    };

    Universe.prototype.updateAll = function(dt) {
      var entity, _i, _len, _ref, _results;
      _ref = this.entities;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        entity = _ref[_i];
        _results.push(entity.update(dt, this.entities));
      }
      return _results;
    };

    Universe.prototype.drawAll = function(context) {
      var entity, _i, _len, _ref, _results;
      this.drawBackground(context);
      _ref = this.entities;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        entity = _ref[_i];
        _results.push(entity.draw(context));
      }
      return _results;
    };

    Universe.prototype.drawBackground = function(context) {
      context.fillStyle = 'black';
      return context.fillRect(0, 0, this.width, this.height);
    };

    Universe.prototype.drawText = function(context, text) {
      context.fillStyle = 'white';
      context.font = '20px Arial';
      return context.fillText(text, 15, 30);
    };

    return Universe;

  })();

}).call(this);
