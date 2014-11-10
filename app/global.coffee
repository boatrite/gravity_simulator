window.randomColor = ->
  '#' + Math.floor(Math.random()*16777215).toString(16)

window.canvas = ->
  document.getElementById 'space'

window.$canvas = ->
  $(canvas())

window.context = ->
  canvas().getContext '2d'

# TODO Remove need for this. Canvas should always be redrawing even when app is paused
window.forceRedraw = ->
  $canvas().trigger 'forceRedraw'

# Creates an object with x and y defined,
# set to the mouse position relative to the canvas
# If you wanna be super-correct this can be tricky,
# we have to worry about padding and borders
# http://simonsarris.com/blog/510-making-html5-canvas-useful
window.getMouse = (e) ->
  element = canvas()
  offsetX = 0
  offsetY = 0

  # Compute the total offset
  loop
    break unless element
    offsetX += element.offsetLeft
    offsetY += element.offsetTop
    element = element.offsetParent

  if document.defaultView && document.defaultView.getComputedStyle
    # Add padding and border style widths to offset
    stylePaddingLeft = parseInt(document.defaultView.getComputedStyle(canvas(), null)['paddingLeft'], 10)      || 0
    stylePaddingTop  = parseInt(document.defaultView.getComputedStyle(canvas(), null)['paddingTop'], 10)       || 0
    styleBorderLeft  = parseInt(document.defaultView.getComputedStyle(canvas(), null)['borderLeftWidth'], 10)  || 0
    styleBorderTop   = parseInt(document.defaultView.getComputedStyle(canvas(), null)['borderTopWidth'], 10)   || 0

    # Also add the offsets in case there's a position:fixed bar
    # Some pages have fixed-position bars (like the stumbleupon bar) at the top or left of the page
    # They will mess up mouse coordinates and this fixes that
    html = document.body.parentNode
    htmlTop = html.offsetTop
    htmlLeft = html.offsetLeft

    offsetX += stylePaddingLeft + styleBorderLeft + htmlLeft
    offsetY += stylePaddingTop + styleBorderTop + htmlTop

  mx = e.pageX - offsetX
  my = e.pageY - offsetY

  return x: mx, y: my
