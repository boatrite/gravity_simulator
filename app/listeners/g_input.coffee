class @GInput
  constructor: ->
    @attachListeners()

  attachListeners: ->
    $GInput = $("#G")
    $GInput.val Universe.G
    $GInput.on 'change', =>
      Universe.G = toInt $GInput.val()
