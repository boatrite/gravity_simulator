class @EntityInputs
  constructor: (@entity) ->
    @name = @entity.name
    @addInputs()
    @attachListeners()

  addInputs: =>
    newEntityControl = "
      <div class='#{@name}'>
        <h1>#{@name.capitalize()}</h1>
        <div class='entity-prop'>
          Mass = <input id='mass-#{@name}' type='number' min='0'></input>kg
        </div>
        <div class='entity-prop'>
          Radius = <input id='radius-#{@name}' type='number' min='0'></input>px
        </div>
        <div class='entity-prop'>
          Position = (
          <input id='position-x-#{@name}' type='number' min='0'></input>,
          <input id='position-y-#{@name}' type='number' min='0'></input>
          )
        </div>
        <div class='entity-prop'>
          Velocity = (
          <input id='velocity-x-#{@name}' type='number'></input>,
          <input id='velocity-y-#{@name}' type='number'></input>
          )
        </div>
        <div class='entity-prop'>
          Color = <input id='color-#{@name}' type='color'></input>
        </div>
      </div>
    "
    $entityControls = $('.entity-controls')
    $entityControls.append newEntityControl
    @$mass = $("#mass-#{@name}")
    @$radius = $("#radius-#{@name}")
    @$posX = $("#position-x-#{@name}")
    @$posY = $("#position-y-#{@name}")
    @$velX = $("#velocity-x-#{@name}")
    @$velY = $("#velocity-y-#{@name}")
    @$color = $("#color-#{@name}")

  attachListeners: =>
    @$mass.on 'change', =>
      @entity.mass = @$mass.val().toInt()
    @$radius.on 'change', =>
      @entity.radius = @$radius.val().toInt()
    @$posX.on 'change', =>
      @entity.position.x = @$posX.val().toInt()
    @$posY.on 'change', =>
      @entity.position.y = @$posY.val().toInt()
    @$velX.on 'change', =>
      @entity.velocity.x = @$velX.val().toInt()
    @$velY.on 'change', =>
      @entity.velocity.y = @$velY.val().toInt()
    @$color.on 'change', =>
      @entity.color = @$color.val()

  update: =>
    @$mass.val @entity.mass
    @$radius.val @entity.radius
    @$posX.val @entity.position.x.floor()
    @$posY.val @entity.position.y.floor()
    @$velX.val @entity.velocity.x.floor()
    @$velY.val @entity.velocity.y.floor()
    @$color.val @entity.color
