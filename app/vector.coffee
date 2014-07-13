class @Vector
  constructor: (@x, @y) ->

  add: (vector) =>
    new Vector @x + vector.x, @y + vector.y

  times: (scalar) =>
    new Vector scalar * @x, scalar * @y

  subtract: (vector) =>
    @add vector.times(-1)

  divide: (scalar) =>
    console.log "Can't divide by 0" if scalar == 0
    @times 1/scalar

  normalize: =>
    if @length() == 0
      return new Vector 0, 0
    else
      @divide @length()

  length: =>
    Math.sqrt @x*@x + @y*@y

  equals: (other) =>
    @x == other.x && @y == other.y
