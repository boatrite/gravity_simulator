class @SpaceDimensionInputs
  constructor: ->
    @space = document.getElementById 'space'
    @$spaceWidth = $("#space-width")
    @$spaceHeight = $("#space-height")

    @setInitialValues()
    @attachListeners()

  setInitialValues: =>
    @$spaceWidth.val @space.width
    @$spaceHeight.val @space.height

  attachListeners: =>
    @$spaceWidth.on 'change', =>
      @space.width = @$spaceWidth.val()

    @$spaceHeight.on 'change', =>
      @space.height = @$spaceHeight.val()
