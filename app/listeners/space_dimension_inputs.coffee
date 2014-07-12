class @SpaceDimensionInputs
  constructor: ->
    @space = $("#space")[0]
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
