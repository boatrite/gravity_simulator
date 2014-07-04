class @PlayButton
  constructor: (runner) ->
    $playBtn = $('#play')
    $playBtn.on 'click', ->
      if $playBtn.html() == 'Play'
        runner.play()
        $playBtn.html 'Pause'
      else if $playBtn.html() == 'Pause'
        runner.pause()
        $playBtn.html 'Play'
