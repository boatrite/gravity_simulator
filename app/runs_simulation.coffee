class @RunsSimulation
  constructor: (@universe) ->
    space = document.getElementById 'space'
    @context = space.getContext '2d'

    fps = 50
    @dt = 1000 / fps # 1000 ms / s * 1 s / 50 frames = 20 ms / frame
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
    @intervalId = setInterval @tick, @dt
    @running = true

  tick: =>
    dtInSeconds = @dt / 1000
    @universe.tick dtInSeconds, @context

