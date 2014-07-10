class @EntityInputs
  constructor: (@entity) ->
    @addInputs()
    @attachListeners()

  addInputs: =>
    name = @entity.name
    newEntityControl = "
      <div class='#{name}'>
        <h1>#{name.capitalize()}</h1>
        <div class='entity-prop'>
          Mass = <input id='mass-#{name}' type='number' min='0'></input>kg
        </div>
        <div class='entity-prop'>
          Radius = <input id='radius-#{name}' type='number' min='0'></input>px
        </div>
        <div class='entity-prop'>
          Position = (
          <input id='position-x-#{name}' type='number' min='0'></input>,
          <input id='position-y-#{name}' type='number' min='0'></input>
          )
        </div>
        <div class='entity-prop'>
          Velocity = (
          <input id='velocity-x-#{name}' type='number'></input>,
          <input id='velocity-y-#{name}' type='number'></input>
          )
        </div>
        <div class='entity-prop'>
          Color = <input id='color-#{name}' type='color'></input>
        </div>
      </div>
    "
    $entityControls = $('.entity-controls')
    $entityControls.append newEntityControl

  attachListeners: =>
    name = @entity.name

    $mass = $("#mass-#{name}")
    $mass.val @entity.mass
    $mass.on 'change', =>
      @entity.mass = $mass.val().toInt()

    $radius = $("#radius-#{name}")
    $radius.val @entity.radius
    $radius.on 'change', =>
      @entity.radius = $radius.val().toInt()

    $posX = $("#position-x-#{name}")
    $posX.val @entity.position.x
    $posX.on 'change', =>
      @entity.position.x = $posX.val().toInt()

    $posY = $("#position-y-#{name}")
    $posY.val @entity.position.y
    $posY.on 'change', =>
      @entity.position.y = $posY.val().toInt()

    $velX = $("#velocity-x-#{name}")
    $velX.val @entity.velocity.x
    $velX.on 'change', =>
      @entity.velocity.x = $velX.val().toInt()

    $velY = $("#velocity-y-#{name}")
    $velY.val @entity.velocity.y
    $velY.on 'change', =>
      @entity.velocity.y = $velY.val().toInt()

    $color = $("#color-#{name}")
    $color.val @entity.color
    $color.on 'change', =>
      @entity.color = $color.val()
