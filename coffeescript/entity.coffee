class @Entity
  constructor: (options) ->
    @mass = options.mass
    @radius = options.radius
    @position = options.position
    @color = options.color

  update: (dt, entities) =>

  draw: (context) =>
    new Circle(@position, @radius, @color).draw context
