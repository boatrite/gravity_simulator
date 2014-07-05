class @Universe
  @G: 1 # Gravitational constant

  constructor: (@width, @height) ->
    @entities = []
    $GInput = $("#G")
    $GInput.val Universe.G
    $GInput.on 'change', =>
      Universe.G = $GInput.val()
      console.log Universe.G

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
    context.fillStyle = 'black'
    context.fillRect 0, 0, @width, @height

  drawText: (context, text) =>
    context.fillStyle = 'white'
    context.font = '20px Arial'
    context.fillText text, 15, 30
