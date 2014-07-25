class @SpaceClickListener
  constructor: (@universe) ->
    @attachListeners()

  attachListeners: =>
    $canvas().on 'click', @addEntity

  addEntity: (e) =>
    entityCount = @universe.entities.length
    name = "entity-#{entityCount+1}"

    x = e.pageX - $canvas().position().left
    y = e.pageY - $canvas().position().top
    position = new Vector x, y

    color = randomColor()

    entity = new Entity(
      name: name,
      position: position,
      color: color
    )
    @universe.addEntity entity
    forceRedraw()
