class @SimulatorControls
  constructor: (@runner) ->
    @$playBtn = $('#play')
    @attachListeners()

  attachListeners: =>
    @$playBtn.on 'click', =>
      @runner.toggleRunning()
      @updateText()

  updateText: =>
    if @$playBtn.html() == 'Play'
      @$playBtn.html 'Pause'
    else
      @$playBtn.html 'Play'

