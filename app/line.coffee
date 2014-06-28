class @Line
  constructor: (@start, @end, @color) ->

  draw: (context) =>
    context.moveTo @start.x, @start.y
    context.lineTo @end.x, @end.y
    context.strokeStyle = @color
    context.lineWidth = 4
    context.stroke()
