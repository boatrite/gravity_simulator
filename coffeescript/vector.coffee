class @Vector
  constructor: (@x, @y) ->

  add: (vector) =>
    new Vector @x + vector.x, @y + vector.y

  subtract: (vector) =>
    @add vector.times(-1)

  times: (scalar) =>
    new Vector scalar * @x, scalar * @y

