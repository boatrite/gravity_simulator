class @Runner
  constructor: (canvas) ->
    width = canvas.width
    height = canvas.height
    @context = canvas.getContext '2d'

    @universe = new Universe width, height
    sun = new Entity(
      mass: 10,
      radius: 40,
      position: new Vector(width / 2, height / 2),
      color: 'yellow'
    )
    @universe.addEntity sun

    earth = new Entity(
      mass: 1,
      radius: 10,
      position: new Vector(width / 2 + width / 8, height / 2),
      color: 'lightBlue'
    )
    @universe.addEntity earth

    fps = 50
    @dt = 1000 / fps
    setInterval @tick, @dt

  tick: =>
    @universe.tick @dt, @context
