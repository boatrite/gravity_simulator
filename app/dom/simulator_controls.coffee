class @SimulatorControls
  constructor: (@runner) ->
    @$playBtn = $("#play")
    @updateText()
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

