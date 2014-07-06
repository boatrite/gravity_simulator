window.toInt = (string) ->
  parseInt string, 10

window.randomColor = ->
  '#' + Math.floor(Math.random()*16777215).toString(16)
