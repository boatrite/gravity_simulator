# TODO The force calculations can be refactored out then optimized
# TODO There seems to be a value object that could be refactored out
# Then this class would just have inputs, labels, the path, and the value object and call update on each
class @Entity
  constructor: (options) ->
    @mass = options.mass || 1
    @radius = options.radius || 10
    @position = options.position || new Vector 0, 0
    @velocity = options.velocity || new Vector 0, 80.randSign()
    @color = options.color || '#ffffff'
    @name = options.name
    @path = new Path @position, 1000, @color
    @entityPropertyElements = new EntityPropertyElements this

  update: (dt, entities) =>
    @netForce = new Vector 0, 0
    for entity in entities when entity isnt this
      force = @calculateForce entity
      @netForce = @netForce.add force
    accel = @netForce.divide @mass
    @velocity = @velocity.add accel.times(dt)
    @position = @position.add @velocity.times(dt)

    @path.continueTo @position
    @entityPropertyElements.update()

  draw: (context) =>
    new Circle(@position, @radius, @color).draw context
    @path.draw context

  # private

  # TODO Put under test
  calculateForce: (otherEntity) =>
    radialFromEntityToThis = @position.subtract otherEntity.position
    separationDistance = radialFromEntityToThis.length()
    forceMagnitude = (-Universe.G * otherEntity.mass * @mass) / (separationDistance * separationDistance)
    forceDirection = radialFromEntityToThis.normalize()
    forceDirection.times forceMagnitude

