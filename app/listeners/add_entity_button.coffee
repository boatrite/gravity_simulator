class @AddEntityButton
  constructor: (@universe) ->
    @attachListeners()

  attachListeners: ->
    $addEntityButton = $(".add-entity").find("button")
    $addEntityButton.on 'click', =>
      entityCount = @universe.entities.length
      mass = toInt $("#mass-new-entity").val()
      radius = toInt $("#radius-new-entity").val()
      posX = toInt $("#position-x-new-entity").val()
      posY = toInt $("#position-y-new-entity").val()
      position = new Vector posX, posY
      velX = toInt $("#velocity-x-new-entity").val()
      velY = toInt $("#velocity-y-new-entity").val()
      velocity = new Vector velX, velY
      color = $("color-new-entity").val()
      entity = new Entity(
        name: "entity-#{entityCount+1}",
        mass: mass,
        radius: radius,
        position: position,
        velocity: velocity,
        color: color
      )
      @universe.addEntity entity
