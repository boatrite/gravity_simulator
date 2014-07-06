class @AddEntityButton
  constructor: (@universe) ->
    @attachListeners()

  attachListeners: =>
    $space = $("#space")
    $space.on 'click', (e) =>
      x = e.pageX - $space.position().left
      y = e.pageY - $space.position().top
      position = new Vector x, y

      entityCount = @universe.entities.length
      name = "entity-#{entityCount+1}"

      color = randomColor()

      entity = new Entity(
        name: name,
        position: position,
        color: color
      )
      @universe.addEntity entity
