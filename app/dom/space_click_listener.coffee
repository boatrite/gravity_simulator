class @SpaceClickListener
  constructor: (@universe) ->
    @attachListeners()

  attachListeners: =>
    $canvas().on 'dblclick', @addEntity

  addEntity: (e) =>
    e.preventDefault()
    entityCount = @universe.entities.length
    name = "entity-#{entityCount+1}"

    mouse = getMouse e
    position = new Vector mouse.x, mouse.y

    color = randomColor()

    entity = new Entity(
      name: name,
      position: position,
      color: color
    )
    @universe.addEntity entity
    jumpToPageBottom()
    forceRedraw()
