// Generated by CoffeeScript 1.7.1
(function() {
  this.GInput = (function() {
    function GInput() {
      this.attachListeners();
    }

    GInput.prototype.attachListeners = function() {
      var $GInput;
      $GInput = $("#G");
      $GInput.val(Universe.G);
      return $GInput.on('change', (function(_this) {
        return function() {
          return Universe.G = toInt($GInput.val());
        };
      })(this));
    };

    return GInput;

  })();

}).call(this);
