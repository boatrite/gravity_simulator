class @Universe
  @G: 1 # Gravitational constant

  constructor: ->
    @entities = []
    new GInput()

  addEntity: (entity) =>
    @entities.push entity

  tick: (dt, context) =>
    @updateAll dt
    @drawAll context

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
