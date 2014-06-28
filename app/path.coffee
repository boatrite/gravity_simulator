class @Path
  NO_PATH_LENGTH_LIMIT = -1

  # maxPathLength: maximum number of elements in @positions array
  constructor: (start, @maxPathLength, @color) ->
    @positions = [start]

  continueTo: (position) =>
    unless @lastPosition().equals position
      @positions.push position
    if @overLengthLimit()
      @shorten()

  draw: (context) =>
    context.beginPath()
    for position, i in @positions
      context.lineTo position.x, position.y
    context.strokeStyle = @color
    context.lineWidth = 2
    context.stroke()

  # private

  lastPosition: =>
    @positions[@positions.length - 1]

  overLengthLimit: =>
    @maxPathLength != NO_PATH_LENGTH_LIMIT && @positions.length >= @maxPathLength

  shorten: =>
    @positions.shift()
