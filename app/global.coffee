window.randomColor = ->
  '#' + Math.floor(Math.random()*16777215).toString(16)

window.canvas = ->
  document.getElementById 'space'

window.$canvas = ->
  $(canvas())

window.context = ->
  canvas().getContext '2d'

window.forceRedraw = ->
  $canvas().trigger 'forceRedraw'
