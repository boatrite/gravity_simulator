// Generated by CoffeeScript 1.7.1
(function() {
  this.SpaceRefreshListener = (function() {
    function SpaceRefreshListener(universe) {
      this.universe = universe;
      $canvas().on('forceRedraw', this.universe.forceRedraw);
    }

    return SpaceRefreshListener;

  })();

}).call(this);
