class @Path
  NO_PATH_LENGTH_LIMIT = -1

  # maxPathLength: maximum number of elements in @positions array
  constructor: (start, @maxPathLength, @color) ->
    @positions = [start]
    @pathWidth = 3

  continueTo: (position) =>
    unless @lastPosition().equals position
      @positions.push position
    if @overLengthLimit()
      @shorten()

  draw: =>
    @drawUniformPath()
    #@drawTaperedPath()

  drawUniformPath: =>
    context().beginPath()
    for position in @positions
      context().lineTo position.x, position.y
    context().strokeStyle = @color
    context().lineWidth = 2
    context().stroke()

  drawTaperedPath: =>
    for position, i in @positions
      if @positions[i + 1]
        context().beginPath()
        context().moveTo position.x, position.y
        context().lineTo @positions[i+1].x, @positions[i+1].y
        context().strokeStyle = @color
        currWidth = @pathWidth * ((i+1) / @positions.length)
        context().lineWidth = currWidth
        context().stroke()

  # private

  lastPosition: =>
    @positions[@positions.length - 1]

  overLengthLimit: =>
    @maxPathLength != NO_PATH_LENGTH_LIMIT && @positions.length >= @maxPathLength

  shorten: =>
    @positions.shift()
