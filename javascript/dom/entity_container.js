// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.EntityContainer = (function() {
    function EntityContainer(entity) {
      this.addElements = __bind(this.addElements, this);
      this.name = entity.name;
      this.addElements();
    }

    EntityContainer.prototype.addElements = function() {
      var containerHTML;
      containerHTML = "<div class='entity " + this.name + "'> <h1>" + (this.name.capitalize()) + "</h1> </div>";
      return $('.entities-container').append(containerHTML);
    };

    return EntityContainer;

  })();

}).call(this);
