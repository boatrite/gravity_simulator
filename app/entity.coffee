# TODO The force calculations can be refactored out then optimized
class @Entity
  constructor: (options) ->
    @buildFromOptions options
    @netForce = new Vector 0, 0
    @acceleration = new Vector 0, 0
    @path = new Path @position, 1000, @color
    @markedForRemoval = false
    @entityDOMElements = new EntityDOMElements this

  update: (dt, entities) =>
    @netForce = @calculateNetForce entities
    @acceleration = @netForce.divide @mass
    @velocity = @velocity.add @acceleration.times(dt)
    @position = @position.add @velocity.times(dt)
    @path.continueTo @position

  draw: =>
    @entityDOMElements.draw()
    @drawBody()
    @drawPath()

  # private

  buildFromOptions: (options) =>
    @mass = options.mass || 1
    @radius = options.radius || 10
    @position = options.position || new Vector 0, 0
    @velocity = options.velocity || new Vector 0, 80.randSign()
    @color = options.color || '#ffffff'
    @name = options.name

  calculateNetForce: (entities) =>
    netForce = new Vector 0, 0
    for entity in entities when entity isnt this
      force = @calculateForce entity
      netForce = netForce.add force
    netForce

  # TODO Put under test
  calculateForce: (otherEntity) =>
    radialFromEntityToThis = @position.subtract otherEntity.position
    separationDistance = radialFromEntityToThis.length()
    forceMagnitude = (-Universe.G * otherEntity.mass * @mass) / (separationDistance * separationDistance)
    forceDirection = radialFromEntityToThis.normalize()
    forceDirection.times forceMagnitude

  drawBody: =>
    new Circle(@position, @radius, @color).draw()

  drawPath: =>
    @path.draw()

