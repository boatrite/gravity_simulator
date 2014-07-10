class @SpaceClick
  constructor: (@universe) ->
    @attachListeners()

  attachListeners: =>
    $("#space").on 'click', @addEntity

  addEntity: (e) =>
    entityCount = @universe.entities.length
    name = "entity-#{entityCount+1}"

    $space = $("#space")
    x = e.pageX - $space.position().left
    y = e.pageY - $space.position().top
    position = new Vector x, y

    color = randomColor()

    entity = new Entity(
      name: name,
      position: position,
      color: color
    )
    @universe.addEntity entity

