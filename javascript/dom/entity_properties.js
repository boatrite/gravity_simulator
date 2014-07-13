// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.EntityProperties = (function() {
    function EntityProperties(entity) {
      this.entity = entity;
      this.update = __bind(this.update, this);
      this.attachListeners = __bind(this.attachListeners, this);
      this.addNetForce = __bind(this.addNetForce, this);
      this.addColor = __bind(this.addColor, this);
      this.addVelocity = __bind(this.addVelocity, this);
      this.addPosition = __bind(this.addPosition, this);
      this.addRadius = __bind(this.addRadius, this);
      this.addMass = __bind(this.addMass, this);
      this.addElements = __bind(this.addElements, this);
      this.$container = $(".entity." + this.entity.name);
      this.addElements();
      this.attachListeners();
    }

    EntityProperties.prototype.addElements = function() {
      this.addMass();
      this.addPosition();
      this.addVelocity();
      this.addNetForce();
      this.addRadius();
      return this.addColor();
    };

    EntityProperties.prototype.addMass = function() {
      var massHTML;
      massHTML = "<div class='entity-prop'> Mass = <input id='mass-" + this.entity.name + "' type='number' min='1'></input>kg </div>";
      this.$container.append(massHTML);
      return this.$mass = $("#mass-" + this.entity.name);
    };

    EntityProperties.prototype.addRadius = function() {
      var radiusHTML;
      radiusHTML = "<div class='entity-prop'> Radius = <input id='radius-" + this.entity.name + "' type='number' min='0'></input>px </div>";
      this.$container.append(radiusHTML);
      return this.$radius = $("#radius-" + this.entity.name);
    };

    EntityProperties.prototype.addPosition = function() {
      var positionHTML;
      positionHTML = "<div class='entity-prop'> Position = ( <input id='position-x-" + this.entity.name + "' type='number' min='0'></input>, <input id='position-y-" + this.entity.name + "' type='number' min='0'></input> ) </div>";
      this.$container.append(positionHTML);
      this.$posX = $("#position-x-" + this.entity.name);
      return this.$posY = $("#position-y-" + this.entity.name);
    };

    EntityProperties.prototype.addVelocity = function() {
      var velocityHTML;
      velocityHTML = "<div class='entity-prop'> Velocity = ( <input id='velocity-x-" + this.entity.name + "' type='number'></input>, <input id='velocity-y-" + this.entity.name + "' type='number'></input> ) </div>";
      this.$container.append(velocityHTML);
      this.$velX = $("#velocity-x-" + this.entity.name);
      return this.$velY = $("#velocity-y-" + this.entity.name);
    };

    EntityProperties.prototype.addColor = function() {
      var colorHTML;
      colorHTML = "<div class='entity-prop'> Color = <input id='color-" + this.entity.name + "' type='color'></input> </div>";
      this.$container.append(colorHTML);
      return this.$color = $("#color-" + this.entity.name);
    };

    EntityProperties.prototype.addNetForce = function() {
      var netForceHTML;
      netForceHTML = "<div class='entity-prop'> Net Force = ( <label id='net-force-x-" + this.entity.name + "'></label>, <label id='net-force-y-" + this.entity.name + "'></label> ) N </div>";
      this.$container.append(netForceHTML);
      this.$netForceX = $("#net-force-x-" + this.entity.name);
      return this.$netForceY = $("#net-force-y-" + this.entity.name);
    };

    EntityProperties.prototype.attachListeners = function() {
      this.$mass.on('change', (function(_this) {
        return function() {
          return _this.entity.mass = _this.$mass.val().toNumber();
        };
      })(this));
      this.$radius.on('change', (function(_this) {
        return function() {
          return _this.entity.radius = _this.$radius.val().toNumber();
        };
      })(this));
      this.$posX.on('change', (function(_this) {
        return function() {
          return _this.entity.position.x = _this.$posX.val().toNumber();
        };
      })(this));
      this.$posY.on('change', (function(_this) {
        return function() {
          return _this.entity.position.y = _this.$posY.val().toNumber();
        };
      })(this));
      this.$velX.on('change', (function(_this) {
        return function() {
          return _this.entity.velocity.x = _this.$velX.val().toNumber();
        };
      })(this));
      this.$velY.on('change', (function(_this) {
        return function() {
          return _this.entity.velocity.y = _this.$velY.val().toNumber();
        };
      })(this));
      return this.$color.on('change', (function(_this) {
        return function() {
          return _this.entity.color = _this.$color.val();
        };
      })(this));
    };

    EntityProperties.prototype.update = function() {
      this.$mass.val(this.entity.mass);
      this.$radius.val(this.entity.radius);
      this.$posX.val(this.entity.position.x.floor());
      this.$posY.val(this.entity.position.y.floor());
      this.$velX.val(this.entity.velocity.x.floor());
      this.$velY.val(this.entity.velocity.y.floor());
      this.$color.val(this.entity.color);
      this.$netForceX.text(this.entity.netForce.x.floor());
      return this.$netForceY.text(this.entity.netForce.y.floor());
    };

    return EntityProperties;

  })();

}).call(this);
