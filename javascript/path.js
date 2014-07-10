// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.Path = (function() {
    var NO_PATH_LENGTH_LIMIT;

    NO_PATH_LENGTH_LIMIT = -1;

    function Path(start, maxPathLength, color) {
      this.maxPathLength = maxPathLength;
      this.color = color;
      this.shorten = __bind(this.shorten, this);
      this.overLengthLimit = __bind(this.overLengthLimit, this);
      this.lastPosition = __bind(this.lastPosition, this);
      this.drawTaperedPath = __bind(this.drawTaperedPath, this);
      this.drawUniformPath = __bind(this.drawUniformPath, this);
      this.draw = __bind(this.draw, this);
      this.continueTo = __bind(this.continueTo, this);
      this.positions = [start];
      this.pathWidth = 3;
    }

    Path.prototype.continueTo = function(position) {
      if (!this.lastPosition().equals(position)) {
        this.positions.push(position);
      }
      if (this.overLengthLimit()) {
        return this.shorten();
      }
    };

    Path.prototype.draw = function(context) {
      return this.drawUniformPath(context);
    };

    Path.prototype.drawUniformPath = function(context) {
      var position, _i, _len, _ref;
      context.beginPath();
      _ref = this.positions;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        position = _ref[_i];
        context.lineTo(position.x, position.y);
      }
      context.strokeStyle = this.color;
      context.lineWidth = 2;
      return context.stroke();
    };

    Path.prototype.drawTaperedPath = function(context) {
      var currWidth, i, position, _i, _len, _ref, _results;
      _ref = this.positions;
      _results = [];
      for (i = _i = 0, _len = _ref.length; _i < _len; i = ++_i) {
        position = _ref[i];
        if (this.positions[i + 1]) {
          context.beginPath();
          context.moveTo(position.x, position.y);
          context.lineTo(this.positions[i + 1].x, this.positions[i + 1].y);
          context.strokeStyle = this.color;
          currWidth = this.pathWidth * ((i + 1) / this.positions.length);
          context.lineWidth = currWidth;
          _results.push(context.stroke());
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    };

    Path.prototype.lastPosition = function() {
      return this.positions[this.positions.length - 1];
    };

    Path.prototype.overLengthLimit = function() {
      return this.maxPathLength !== NO_PATH_LENGTH_LIMIT && this.positions.length >= this.maxPathLength;
    };

    Path.prototype.shorten = function() {
      return this.positions.shift();
    };

    return Path;

  })();

}).call(this);
