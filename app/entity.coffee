class @Entity
  NO_PATH_LENGTH_LIMIT = -1

  constructor: (options) ->
    @mass = options.mass || 1
    @radius = options.radius || 10
    @position = options.position || new Vector 0, 0
    @velocity = options.velocity || new Vector 0, 0
    @color = options.color || 'white'

    @path = [@position]
    @maxPathLength = NO_PATH_LENGTH_LIMIT # maximum number of elements in @path array. -1 for no limit

  update: (dt, entities) =>
    dt /= 1000 # ms to seconds
    center = new Vector 500, 200
    accel_dir = center.subtract(@position).normalize()
    tangential_velocity = @velocity.length()
    centripetal_accel = tangential_velocity * tangential_velocity / 125
    accel = accel_dir.times centripetal_accel
    @velocity = @velocity.add accel.times(dt)
    @position = @position.add @velocity.times(dt)

    @updatePath()

  updatePath: ->
    [..., last] = @path
    unless last.equals @position
      @path.push @position
    if @maxPathLength != NO_PATH_LENGTH_LIMIT && @path.length > @maxPathLength
      @path.shift()


  draw: (context) =>
    new Circle(@position, @radius, @color).draw context
    new Path(@path, @color).draw context
