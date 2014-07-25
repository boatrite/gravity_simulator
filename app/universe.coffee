class @Universe
  @G: 1 # Gravitational constant

  constructor: ->
    @entities = []

  addEntity: (entity) =>
    @entities.push entity

  addEntities: (entities) =>
    for entity in entities
      @addEntity entity

  tick: (dt) =>
    @removeMarkedEntities()
    @updateAll dt
    @drawAll()

  drawAll: =>
    @drawBackground()
    @drawEntities()

  forceRedraw: =>
    @removeMarkedEntities()
    @drawAll()

  # private

  removeMarkedEntities: =>
    @entities = @entities.reject (entity) ->
      entity.markedForRemoval

  updateAll: (dt) =>
    for entity in @entities
      entity.update dt, @entities

  drawEntities: =>
    for entity in @entities
      entity.draw()

  drawBackground: =>
    context().fillStyle = 'black'
    context().fillRect 0, 0, canvas().width, canvas().height
