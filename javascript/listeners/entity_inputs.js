// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.EntityInputs = (function() {
    function EntityInputs(entity) {
      this.entity = entity;
      this.update = __bind(this.update, this);
      this.attachListeners = __bind(this.attachListeners, this);
      this.addInputs = __bind(this.addInputs, this);
      this.name = this.entity.name;
      this.addInputs();
      this.attachListeners();
    }

    EntityInputs.prototype.addInputs = function() {
      var $entityControls, newEntityControl;
      newEntityControl = "<div class='" + this.name + "'> <h1>" + (this.name.capitalize()) + "</h1> <div class='entity-prop'> Mass = <input id='mass-" + this.name + "' type='number' min='0'></input>kg </div> <div class='entity-prop'> Radius = <input id='radius-" + this.name + "' type='number' min='0'></input>px </div> <div class='entity-prop'> Position = ( <input id='position-x-" + this.name + "' type='number' min='0'></input>, <input id='position-y-" + this.name + "' type='number' min='0'></input> ) </div> <div class='entity-prop'> Velocity = ( <input id='velocity-x-" + this.name + "' type='number'></input>, <input id='velocity-y-" + this.name + "' type='number'></input> ) </div> <div class='entity-prop'> Color = <input id='color-" + this.name + "' type='color'></input> </div> </div>";
      $entityControls = $('.entity-controls');
      $entityControls.append(newEntityControl);
      this.$mass = $("#mass-" + this.name);
      this.$radius = $("#radius-" + this.name);
      this.$posX = $("#position-x-" + this.name);
      this.$posY = $("#position-y-" + this.name);
      this.$velX = $("#velocity-x-" + this.name);
      this.$velY = $("#velocity-y-" + this.name);
      return this.$color = $("#color-" + this.name);
    };

    EntityInputs.prototype.attachListeners = function() {
      this.$mass.on('change', (function(_this) {
        return function() {
          return _this.entity.mass = _this.$mass.val().toInt();
        };
      })(this));
      this.$radius.on('change', (function(_this) {
        return function() {
          return _this.entity.radius = _this.$radius.val().toInt();
        };
      })(this));
      this.$posX.on('change', (function(_this) {
        return function() {
          return _this.entity.position.x = _this.$posX.val().toInt();
        };
      })(this));
      this.$posY.on('change', (function(_this) {
        return function() {
          return _this.entity.position.y = _this.$posY.val().toInt();
        };
      })(this));
      this.$velX.on('change', (function(_this) {
        return function() {
          return _this.entity.velocity.x = _this.$velX.val().toInt();
        };
      })(this));
      this.$velY.on('change', (function(_this) {
        return function() {
          return _this.entity.velocity.y = _this.$velY.val().toInt();
        };
      })(this));
      return this.$color.on('change', (function(_this) {
        return function() {
          return _this.entity.color = _this.$color.val();
        };
      })(this));
    };

    EntityInputs.prototype.update = function() {
      this.$mass.val(this.entity.mass.floor());
      this.$radius.val(this.entity.radius.floor());
      this.$posX.val(this.entity.position.x.floor());
      this.$posY.val(this.entity.position.y.floor());
      this.$velX.val(this.entity.velocity.x.floor());
      this.$velY.val(this.entity.velocity.y.floor());
      return this.$color.val(this.entity.color);
    };

    return EntityInputs;

  })();

}).call(this);
