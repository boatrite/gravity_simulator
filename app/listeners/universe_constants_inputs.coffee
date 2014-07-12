class @UniverseConstantsInputs
  constructor: ->
    @$G = $("#G")

    @setInitialValues()
    @attachListeners()

  setInitialValues: =>
    @$G.val Universe.G

  attachListeners: =>
    @$G.on 'change', =>
      Universe.G = @$G.val().toInt()
