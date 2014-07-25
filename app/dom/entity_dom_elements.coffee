class @EntityDOMElements
  constructor: (@entity) ->
    new EntityContainer @entity
    @entityProperties = new EntityProperties @entity
    new EntityFunctions @entity

  draw: =>
    @entityProperties.draw()
