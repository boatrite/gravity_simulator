class @SpaceDragListener
  constructor: (@universe) ->
    @entityToDrag = null
    @dragOffsetX = 0
    @dragOffsetY = 0
    @attachListeners()

  attachListeners: =>
    $canvas().on 'mousedown', @selectEntity
    $canvas().on 'mousemove', @moveEntity
    $canvas().on 'mouseup', @deselectEntity

  selectEntity: (e) =>
    mouse = getMouse e
    mx = mouse.x
    my = mouse.y
    entity = @universe.entityAt mx, my
    if entity
      @dragOffsetX = mx - entity.position.x
      @dragOffsetY = my - entity.position.y
      @entityToDrag = entity

  moveEntity: (e) =>
    return unless @entityToDrag
    mouse = getMouse e
    @entityToDrag.position = new Vector(mouse.x - @dragOffsetX, mouse.y - @dragOffsetY)
    forceRedraw()

  deselectEntity: =>
    @entityToDrag = null
