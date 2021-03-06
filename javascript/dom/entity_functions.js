// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.EntityFunctions = (function() {
    function EntityFunctions(entity) {
      this.entity = entity;
      this.addListeners = __bind(this.addListeners, this);
      this.addElements = __bind(this.addElements, this);
      this.$container = $(".entity." + this.entity.name);
      this.addElements();
      this.addListeners();
    }

    EntityFunctions.prototype.addElements = function() {
      var removeHTML;
      removeHTML = "<a class='remove-entity " + this.entity.name + "' href='#'>Remove this entity</a>";
      this.$container.append(removeHTML);
      return this.$removeEntity = $("a.remove-entity." + this.entity.name);
    };

    EntityFunctions.prototype.addListeners = function() {
      return this.$removeEntity.on('click', (function(_this) {
        return function(e) {
          e.preventDefault();
          _this.entity.markedForRemoval = true;
          _this.$container.remove();
          return forceRedraw();
        };
      })(this));
    };

    return EntityFunctions;

  })();

}).call(this);
