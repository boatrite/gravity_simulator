class @Entity
  constructor: (options) ->
    @mass = options.mass || 1
    @radius = options.radius || 10
    @position = options.position || new Vector 0, 0
    @velocity = options.velocity || new Vector 0, 20.randSign()
    @color = options.color || '#ffffff'
    @name = options.name
    @path = new Path @position, 1000, @color
    new EntityInputs this

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
    forceMagnitude = (-Universe.G * otherEntity.mass * @mass) / (separationDistance * separationDistance)
    forceDirection = radialFromEntityToThis.normalize()
    forceDirection.times forceMagnitude

