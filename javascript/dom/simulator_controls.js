// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.SimulatorControls = (function() {
    function SimulatorControls(runner) {
      this.runner = runner;
      this.updateText = __bind(this.updateText, this);
      this.attachListeners = __bind(this.attachListeners, this);
      this.$playBtn = $("#play");
      this.updateText();
      this.attachListeners();
    }

    SimulatorControls.prototype.attachListeners = function() {
      return this.$playBtn.on('click', (function(_this) {
        return function() {
          _this.runner.toggleRunning();
          return _this.updateText();
        };
      })(this));
    };

    SimulatorControls.prototype.updateText = function() {
      if (this.$playBtn.html() === 'Play') {
        return this.$playBtn.html('Pause');
      } else {
        return this.$playBtn.html('Play');
      }
    };

    return SimulatorControls;

  })();

}).call(this);
