class @Circle
  constructor: (position, radius, color) ->
    @centerX = position.x
    @centerY = position.y
    @radius = radius
    @color = color

  draw: (context) =>
    context.beginPath()
    context.arc @centerX, @centerY, @radius, 0, 2 * Math.PI, false
    context.fillStyle = @color
    context.fill()
