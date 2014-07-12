class @Universe
  @G: 1 # Gravitational constant

  constructor: ->
    @entities = []

  addEntity: (entity) =>
    @entities.push entity

  addEntities: (entities) =>
    for entity in entities
      @addEntity entity

  tick: (dt, context) =>
    @updateAll dt
    @drawAll context

  # private

  updateAll: (dt) =>
    for entity in @entities
      entity.update dt, @entities

  drawAll: (context) =>
    @drawBackground context
    for entity in @entities
      entity.draw context

  drawBackground: (context) =>
    space = $("#space")[0]
    context.fillStyle = 'black'
    context.fillRect 0, 0, space.width, space.height
