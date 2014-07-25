class @SpaceRefreshListener
  constructor: (@universe) ->
    $canvas().on 'forceRedraw', @universe.forceRedraw
