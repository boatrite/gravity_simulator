class @RunsSimulation
  constructor: (@universe) ->
    space = document.getElementById 'space'
    @context = space.getContext '2d'

    fps = 50
    @dt = 1000 / fps
    @play()
    @playButton = new PlayButton this

  toggleRunning: =>
    if @running
      @playButton.pause()
      @pause()
    else
      @playButton.play()
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

