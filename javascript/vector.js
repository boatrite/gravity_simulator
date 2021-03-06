// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.Vector = (function() {
    function Vector(x, y) {
      this.x = x;
      this.y = y;
      this.equals = __bind(this.equals, this);
      this.distanceTo = __bind(this.distanceTo, this);
      this.length = __bind(this.length, this);
      this.normalize = __bind(this.normalize, this);
      this.divide = __bind(this.divide, this);
      this.subtract = __bind(this.subtract, this);
      this.times = __bind(this.times, this);
      this.add = __bind(this.add, this);
    }

    Vector.prototype.add = function(vector) {
      return new Vector(this.x + vector.x, this.y + vector.y);
    };

    Vector.prototype.times = function(scalar) {
      return new Vector(scalar * this.x, scalar * this.y);
    };

    Vector.prototype.subtract = function(vector) {
      return this.add(vector.times(-1));
    };

    Vector.prototype.divide = function(scalar) {
      if (scalar === 0) {
        console.log("Can't divide by 0");
      }
      return this.times(1 / scalar);
    };

    Vector.prototype.normalize = function() {
      if (this.length() === 0) {
        return new Vector(0, 0);
      } else {
        return this.divide(this.length());
      }
    };

    Vector.prototype.length = function() {
      return Math.sqrt(this.x * this.x + this.y * this.y);
    };

    Vector.prototype.distanceTo = function(vector) {
      return Math.sqrt(Math.pow(this.x - vector.x, 2) + Math.pow(this.y - vector.y, 2));
    };

    Vector.prototype.equals = function(other) {
      return this.x === other.x && this.y === other.y;
    };

    return Vector;

  })();

}).call(this);
