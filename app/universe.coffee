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
    net_forces = @calculateNetForces()
    for entity in @entities
      entity.update dt, net_forces[entity.name]

  calculateNetForces: =>
    net_forces = {}
    for entity in @entities
      net_forces[entity.name] = new Vector(0, 0)
    for x in [0...@entities.length]
      entity_one = @entities[x]
      for y in [x+1...@entities.length]
        entity_two = @entities[y]
        force_on_one_by_two = @force_on_entity_by_entity(entity_one, entity_two)
        net_forces[entity_one.name] = net_forces[entity_one.name].add force_on_one_by_two
        net_forces[entity_two.name] = net_forces[entity_two.name].add force_on_one_by_two.times(-1)
    net_forces

  force_on_entity_by_entity: (entityOne, entityTwo) =>
    radialFromTwoToOne = entityOne.position.subtract entityTwo.position
    separationDistance = radialFromTwoToOne.length()
    forceMagnitude = (-Universe.G * entityTwo.mass * entityOne.mass) / (separationDistance * separationDistance)
    forceDirection = radialFromTwoToOne.normalize()
    forceDirection.times forceMagnitude

  drawEntities: =>
    for entity in @entities
      entity.draw()

  drawBackground: =>
    context().fillStyle = 'black'
    context().fillRect 0, 0, canvas().width, canvas().height
