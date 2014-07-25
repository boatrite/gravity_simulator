class @SpaceDimensionInputs
  constructor: ->
    @$spaceWidth = $("#space-width")
    @$spaceHeight = $("#space-height")
    @setInitialValues()
    @attachListeners()

  setInitialValues: =>
    @$spaceWidth.val canvas().width
    @$spaceHeight.val canvas().height

  attachListeners: =>
    @$spaceWidth.on 'change', =>
      canvas().width = @$spaceWidth.val()
    @$spaceHeight.on 'change', =>
      canvas().height = @$spaceHeight.val()
