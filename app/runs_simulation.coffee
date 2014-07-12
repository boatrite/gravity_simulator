class @RunsSimulation
  constructor: (@universe) ->
    space = document.getElementById 'space'
    @context = space.getContext '2d'

    fps = 30
    @dtInSeconds = 1 / fps
    $("#fps").text fps
    $("#dt").text @dtInSeconds.toFixed(4)

    @play()

  toggleRunning: =>
    if @running
      @pause()
    else
      @play()

  # private

  pause: =>
    clearInterval @intervalId
    @running = false

  play: =>
    dtInMilliseconds = @dtInSeconds * 1000
    @intervalId = setInterval @tick, dtInMilliseconds
    @running = true

  tick: =>
    @universe.tick @dtInSeconds, @context
