class @GInput
  constructor: ->
    $GInput = $("#G")
    $GInput.val Universe.G
    $GInput.on 'change', =>
      Universe.G = $GInput.val()
