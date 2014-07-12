class @ConfiguresPresetEntities
  @sunAndPlanet: ->
    entities = []
    width = $("#space").width()
    height = $("#space").height()
    entities.push new Entity(
      name: 'sun',
      mass: 1000000,
      radius: 40,
      position: new Vector(width / 2, height / 2),
      velocity: new Vector(0, 0),
      color: '#ffe700'
    )
    entities.push new Entity(
      name: 'planet',
      mass: 1,
      radius: 10,
      position: new Vector(width / 2 + width / 8, height / 2),
      velocity: new Vector(0, -100),
      color: '#00ffce'
    )
    entities
