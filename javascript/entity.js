// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.Entity = (function() {
    function Entity(options) {
      this.accel = __bind(this.accel, this);
      this.draw = __bind(this.draw, this);
      this.update = __bind(this.update, this);
      this.mass = options.mass || 1;
      this.radius = options.radius || 10;
      this.position = options.position || new Vector(0, 0);
      this.velocity = options.velocity || new Vector(0, 0);
      this.color = options.color || 'white';
      this.path = new Path(this.position, 200, this.color);
    }

    Entity.prototype.update = function(dt, entities) {
      this.velocity = this.velocity.add(this.accel().times(dt));
      this.position = this.position.add(this.velocity.times(dt));
      return this.path.continueTo(this.position);
    };

    Entity.prototype.draw = function(context) {
      new Circle(this.position, this.radius, this.color).draw(context);
      return this.path.draw(context);
    };

    Entity.prototype.accel = function() {
      var accel_dir, center, centripetal_accel, tangential_velocity;
      center = new Vector(500, 200);
      accel_dir = center.subtract(this.position).normalize();
      tangential_velocity = this.velocity.length();
      centripetal_accel = tangential_velocity * tangential_velocity / 125;
      return accel_dir.times(centripetal_accel);
    };

    return Entity;

  })();

}).call(this);
