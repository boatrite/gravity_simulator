// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.Line = (function() {
    function Line(start, end, color) {
      this.start = start;
      this.end = end;
      this.color = color;
      this.draw = __bind(this.draw, this);
    }

    Line.prototype.draw = function(context) {
      context.moveTo(this.start.x, this.start.y);
      context.lineTo(this.end.x, this.end.y);
      context.strokeStyle = this.color;
      context.lineWidth = 4;
      return context.stroke();
    };

    return Line;

  })();

}).call(this);
