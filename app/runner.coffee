class @Runner
  constructor: (canvas) ->
    width = canvas.width
    height = canvas.height
    @context = canvas.getContext '2d'

    @universe = new Universe width, height
    sun = new Entity(
      name: 'sun',
      mass: 1000000,
      radius: 40,
      position: new Vector(width / 2, height / 2),
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
    @intervalId = setInterval @tick, @dt
    new PlayButton this

  tick: =>
    dtInSeconds = @dt / 1000
    @universe.tick dtInSeconds, @context

  pause: =>
    clearInterval @intervalId

  play: =>
    @intervalId = setInterval @tick, @dt
