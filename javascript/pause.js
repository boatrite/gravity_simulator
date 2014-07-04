// Generated by CoffeeScript 1.7.1
(function() {
  this.Pause = (function() {
    function Pause(runner) {
      var $pauseBtn;
      $pauseBtn = $('#pause');
      $pauseBtn.on('click', function() {
        if ($pauseBtn.html() === 'Play') {
          runner.play();
          return $pauseBtn.html('Pause');
        } else if ($pauseBtn.html() === 'Pause') {
          runner.pause();
          return $pauseBtn.html('Play');
        }
      });
    }

    return Pause;

  })();

}).call(this);