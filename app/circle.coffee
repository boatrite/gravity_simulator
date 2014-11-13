class @Circle
  constructor: (@center, @radius, @color) ->

  draw: =>
    context().beginPath()
    context().arc @center.x, @center.y, @radius, 0, 2 * Math.PI, false
    context().fillStyle = @color
    context().fill()

  containsPoint: (x, y) =>
    @center.distanceTo(new Vector(x, y)) <= @radius
