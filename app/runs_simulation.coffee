class @RunsSimulation
  constructor: (@universe) ->
    @step = 1/60
    @play()

  toggleRunning: =>
    if @running
      @pause()
    else
      @play()

  # private

  tick: =>
    @universe.removeMarkedEntities()
    now = @timestamp()
    @dt = @dt + Math.min(1, (now - @last) / 1000)
    while(@dt > @step)
      @dt = @dt - @step
      @universe.updateAll @step
    @universe.drawAll()
    @last = now
    if @running
      requestAnimationFrame(@tick)

  timestamp: =>
    if window.performance && window.performance.now
      window.performance.now()
    else
      new Date().getTime()

  play: =>
    @running = true
    @dt = 0
    @last = @timestamp()
    requestAnimationFrame(@tick)

  pause: =>
    @running = false
