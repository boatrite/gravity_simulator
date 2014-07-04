class @Entity
  constructor: (options) ->
    @mass = options.mass || 1
    @radius = options.radius || 10
    @position = options.position || new Vector 0, 0
    @velocity = options.velocity || new Vector 0, 0
    @color = options.color || 'white'
    @path = new Path @position, 200, @color

  update: (dt, entities) =>
    for entity in entities when entity isnt this
      force = @calculateForce entity
      accel = force.divide @mass
      @velocity = @velocity.add accel.times(dt)
      @position = @position.add @velocity.times(dt)
    @path.continueTo @position

  draw: (context) =>
    new Circle(@position, @radius, @color).draw context
    @path.draw context

  # private

  calculateForce: (otherEntity) =>
    radialFromEntityToThis = @position.subtract otherEntity.position
    separationDistance = radialFromEntityToThis.length()
    force_magnitude = (-Universe.G * otherEntity.mass * @mass) / (separationDistance * separationDistance)
    force_direction = radialFromEntityToThis.normalize()
    force_direction.times force_magnitude

