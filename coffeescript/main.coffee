require ['circle']
require ['entity']
require ['runner']
require ['universe']
require ['vector']
require ['jquery'], ($) ->
  $(document).ready ->
    runner = new Runner document.getElementById 'canvas'
