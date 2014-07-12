class @EntityPropertyElements
  constructor: (@entity) ->
    @name = @entity.name
    @addElements()
    @attachListeners()

  addElements: =>
    entityElementsHTML = "
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
        <div class='entity-prop'>
          Net Force = (
          <label id='net-force-x-#{@name}'></label>,
          <label id='net-force-y-#{@name}'></label>
          ) N
        </div>
      </div>
    "
    $('.entities-container').append entityElementsHTML
    @$mass = $("#mass-#{@name}")
    @$radius = $("#radius-#{@name}")
    @$posX = $("#position-x-#{@name}")
    @$posY = $("#position-y-#{@name}")
    @$velX = $("#velocity-x-#{@name}")
    @$velY = $("#velocity-y-#{@name}")
    @$color = $("#color-#{@name}")
    @$netForceX = $("#net-force-x-#{@name}")
    @$netForceY = $("#net-force-y-#{@name}")

  attachListeners: =>
    @$mass.on 'change', =>
      @entity.mass = @$mass.val().toNumber()
    @$radius.on 'change', =>
      @entity.radius = @$radius.val().toNumber()
    @$posX.on 'change', =>
      @entity.position.x = @$posX.val().toNumber()
    @$posY.on 'change', =>
      @entity.position.y = @$posY.val().toNumber()
    @$velX.on 'change', =>
      @entity.velocity.x = @$velX.val().toNumber()
    @$velY.on 'change', =>
      @entity.velocity.y = @$velY.val().toNumber()
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
    @$netForceX.text @entity.netForce.x.floor()
    @$netForceY.text @entity.netForce.y.floor()
