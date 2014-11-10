// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.SpaceDragListener = (function() {
    function SpaceDragListener(universe) {
      this.universe = universe;
      this.deselectEntity = __bind(this.deselectEntity, this);
      this.moveEntity = __bind(this.moveEntity, this);
      this.selectEntity = __bind(this.selectEntity, this);
      this.attachListeners = __bind(this.attachListeners, this);
      this.entityToDrag = null;
      this.dragOffsetX = 0;
      this.dragOffsetY = 0;
      this.attachListeners();
    }

    SpaceDragListener.prototype.attachListeners = function() {
      $canvas().on('mousedown', this.selectEntity);
      $canvas().on('mousemove', this.moveEntity);
      return $canvas().on('mouseup', this.deselectEntity);
    };

    SpaceDragListener.prototype.selectEntity = function(e) {
      var entity, mouse, mx, my;
      mouse = getMouse(e);
      mx = mouse.x;
      my = mouse.y;
      entity = this.universe.entityAt(mx, my);
      if (entity) {
        this.dragOffsetX = mx - entity.position.x;
        this.dragOffsetY = my - entity.position.y;
        return this.entityToDrag = entity;
      }
    };

    SpaceDragListener.prototype.moveEntity = function(e) {
      var mouse;
      if (!this.entityToDrag) {
        return;
      }
      mouse = getMouse(e);
      this.entityToDrag.position = new Vector(mouse.x - this.dragOffsetX, mouse.y - this.dragOffsetY);
      return forceRedraw();
    };

    SpaceDragListener.prototype.deselectEntity = function() {
      return this.entityToDrag = null;
    };

    return SpaceDragListener;

  })();

}).call(this);
