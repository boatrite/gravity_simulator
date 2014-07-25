class @RunsSimulation
  constructor: (@universe) ->
    @setDeltaT()
    @setLabelText()
    @play()

  toggleRunning: =>
    if @running()
      @pause()
    else
      @play()

  # private

  setDeltaT: =>
    @fps = 30
    @dtInSeconds = 1 / @fps

  setLabelText: =>
    $("#fps").text @fps
    $("#dt").text @dtInSeconds.toFixed(4)

  play: =>
    dtInMilliseconds = @dtInSeconds * 1000
    @intervalId = setInterval @tick, dtInMilliseconds

  pause: =>
    @intervalId = clearInterval @intervalId

  running: =>
    !!@intervalId

  tick: =>
    @universe.tick @dtInSeconds
