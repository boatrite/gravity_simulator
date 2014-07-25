class @EntityFunctions
  constructor: (@entity) ->
    @$container = $(".entity.#{@entity.name}")
    @addElements()
    @addListeners()

  addElements: =>
    removeHTML = "
      <a class='remove-entity #{@entity.name}' href='#'>Remove this entity</a>
    "
    @$container.append removeHTML
    @$removeEntity = $("a.remove-entity.#{@entity.name}")

  addListeners: =>
    @$removeEntity.on 'click', =>
      @entity.markedForRemoval = true
      @$container.remove()
      forceRedraw()
