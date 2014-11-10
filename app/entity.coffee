class @Entity
  constructor: (options) ->
    @buildFromOptions options
    @acceleration = new Vector 0, 0
    @netForce = new Vector 0, 0
    @path = new Path @position, Path.NO_PATH_LENGTH_LIMIT, @color
    @markedForRemoval = false
    @entityDOMElements = new EntityDOMElements this

  update: (dt, netForce) =>
    @netForce = netForce
    @acceleration = @netForce.divide @mass
    @velocity = @velocity.add @acceleration.times(dt)
    @position = @position.add @velocity.times(dt)
    @path.continueTo @position

  draw: =>
    @entityDOMElements.draw()
    @drawBody()
    @drawPath()

  containsPoint: (x, y) =>
    new Circle(@position, @radius).containsPoint(x, y)

  # private

  buildFromOptions: (options) =>
    @mass = options.mass || 1
    @radius = options.radius || 10
    @position = options.position || new Vector 0, 0
    @velocity = options.velocity || new Vector 0, 80.randSign()
    @color = options.color || '#ffffff'
    @name = options.name

  drawBody: =>
    new Circle(@position, @radius, @color).draw()

  drawPath: =>
    @path.draw()

