class @Entity
  constructor: (options) ->
    @mass = options.mass || 1
    @radius = options.radius || 10
    @position = options.position || new Vector 0, 0
    @velocity = options.velocity || new Vector 0, 0
    @color = options.color || 'white'

  update: (dt, entities) =>
    dt /= 1000 # ms to seconds
    center = new Vector 500, 200
    accel_dir = center.subtract(@position).normalize()
    tangential_velocity = @velocity.length()
    centripetal_accel = tangential_velocity * tangential_velocity / 125
    accel = accel_dir.times centripetal_accel
    @velocity = @velocity.add accel.times(dt)
    @position = @position.add @velocity.times(dt)

  draw: (context) =>
    new Circle(@position, @radius, @color).draw context
