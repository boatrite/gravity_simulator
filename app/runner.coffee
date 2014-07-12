class @Runner
  constructor: ->
    space = $('#space')[0]
    width = space.width
    height = space.height
    @context = space.getContext '2d'

    @universe = new Universe()
    sun = new Entity(
      name: 'sun',
      mass: 1000000,
      radius: 40,
      position: new Vector(width / 2, height / 2),
      velocity: new Vector(0, 0),
      color: '#ffe700'
    )
    @universe.addEntity sun

    earth = new Entity(
      name: 'earth',
      mass: 1,
      radius: 10,
      position: new Vector(width / 2 + width / 8, height / 2),
      velocity: new Vector(0, -100),
      color: '#00fcff'
    )
    @universe.addEntity earth

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

