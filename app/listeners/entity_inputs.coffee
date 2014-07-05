class @EntityInputs
  constructor: (@entity) ->
    @attachListeners()

  attachListeners: =>
    entityName = @entity.name

    $mass = $("#mass-#{entityName}")
    $mass.val @entity.mass
    $mass.on 'change', =>
      @entity.mass = @toInt $mass.val()

    $radius = $("#radius-#{entityName}")
    $radius.val @entity.radius
    $radius.on 'change', =>
      @entity.radius = @toInt $radius.val()

    $posX = $("#position-x-#{entityName}")
    $posX.val @entity.position.x
    $posX.on 'change', =>
      @entity.position.x = @toInt $posX.val()

    $posY = $("#position-y-#{entityName}")
    $posY.val @entity.position.y
    $posY.on 'change', =>
      @entity.position.y = @toInt $posY.val()

    $velX = $("#velocity-x-#{entityName}")
    $velX.val @entity.velocity.x
    $velX.on 'change', =>
      @entity.velocity.x = @toInt $velX.val()

    $velY = $("#velocity-y-#{entityName}")
    $velY.val @entity.velocity.y
    $velY.on 'change', =>
      @entity.velocity.y = @toInt $velY.val()

    $color = $("#color-#{entityName}")
    $color.val @entity.color
    $color.on 'change', =>
      @entity.color = $color.val()

   # private

   toInt: (string) ->
      parseInt string, 10
