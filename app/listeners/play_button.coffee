class @PlayButton
  constructor: (@runner) ->
    @$playBtn = $('#play')
    @attachListeners()

  attachListeners: =>
    @$playBtn.on 'click', @runner.toggleRunning

  pause: =>
    @$playBtn.html 'Play'

  play: =>
    @$playBtn.html 'Pause'
