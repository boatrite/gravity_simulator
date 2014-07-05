class @Universe
  @G: 1 # Gravitational constant

  constructor: (@width, @height) ->
    @entities = []
    new GInput()

  addEntity: (entity) =>
    @entities.push entity

  tick: (dt, context) =>
    # TODO Remove me
    #for entity in @entities
      #console.log "#{entity.name} posX #{entity.position.x}"
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
    context.fillStyle = 'black'
    context.fillRect 0, 0, @width, @height
