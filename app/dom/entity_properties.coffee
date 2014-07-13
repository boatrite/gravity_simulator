class @EntityProperties
  constructor: (@entity) ->
    @$container = $(".entity.#{@entity.name}")
    @addElements()
    @attachListeners()

  addElements: =>
    @addMass()
    @addPosition()
    @addVelocity()
    @addNetForce()
    @addRadius()
    @addColor()

  addMass: =>
    massHTML = "
      <div class='entity-prop'>
        Mass = <input id='mass-#{@entity.name}' type='number' min='1'></input>kg
      </div>
    "
    @$container.append massHTML
    @$mass = $("#mass-#{@entity.name}")

  addRadius: =>
    radiusHTML = "
      <div class='entity-prop'>
        Radius = <input id='radius-#{@entity.name}' type='number' min='0'></input>px
      </div>
    "
    @$container.append radiusHTML
    @$radius = $("#radius-#{@entity.name}")

  addPosition: =>
    positionHTML = "
      <div class='entity-prop'>
        Position = (
        <input id='position-x-#{@entity.name}' type='number' min='0'></input>,
        <input id='position-y-#{@entity.name}' type='number' min='0'></input>
        )
      </div>
    "
    @$container.append positionHTML
    @$posX = $("#position-x-#{@entity.name}")
    @$posY = $("#position-y-#{@entity.name}")

  addVelocity: =>
    velocityHTML = "
      <div class='entity-prop'>
        Velocity = (
        <input id='velocity-x-#{@entity.name}' type='number'></input>,
        <input id='velocity-y-#{@entity.name}' type='number'></input>
        )
      </div>
    "
    @$container.append velocityHTML
    @$velX = $("#velocity-x-#{@entity.name}")
    @$velY = $("#velocity-y-#{@entity.name}")

  addColor: =>
    colorHTML = "
      <div class='entity-prop'>
        Color = <input id='color-#{@entity.name}' type='color'></input>
      </div>
    "
    @$container.append colorHTML
    @$color = $("#color-#{@entity.name}")

  addNetForce: =>
    netForceHTML = "
      <div class='entity-prop'>
        Net Force = (
        <label id='net-force-x-#{@entity.name}'></label>,
        <label id='net-force-y-#{@entity.name}'></label>
        ) N
      </div>
    "
    @$container.append netForceHTML
    @$netForceX = $("#net-force-x-#{@entity.name}")
    @$netForceY = $("#net-force-y-#{@entity.name}")

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
