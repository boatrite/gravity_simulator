// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.Circle = (function() {
    function Circle(center, radius, color) {
      this.center = center;
      this.radius = radius;
      this.color = color;
      this.draw = __bind(this.draw, this);
    }

    Circle.prototype.draw = function(context) {
      context.beginPath();
      context.arc(this.center.x, this.center.y, this.radius, 0, 2 * Math.PI, false);
      context.fillStyle = this.color;
      return context.fill();
    };

    return Circle;

  })();

}).call(this);
