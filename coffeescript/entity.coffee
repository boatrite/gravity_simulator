class @Entity
  constructor: (options) ->
    @mass = options.mass || 1
    @radius = options.radius || 10
    @position = options.position || new Vector 0, 0
    @velocity = options.velocity || new Vector 0, 0
    @color = options.color || 'white'

  update: (dt, entities) =>
    # TODO This is totally jank.
    # Accel needs to be properly calculated
    # But work on gettings tails next
    center = new Vector 500, 200
    accel = @position.subtract center
    @velocity = @velocity.subtract accel.times(dt/1000000)
    @position = @position.add @velocity.times(dt)

  draw: (context) =>
    new Circle(@position, @radius, @color).draw context
