class @Path
  constructor: (@positions, @color) ->

  draw: (context) =>
    context.beginPath()
    for position, i in @positions
      context.lineTo position.x, position.y
    context.strokeStyle = @color
    context.lineWidth = 2
    context.stroke()
