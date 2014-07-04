require ['lib/jquery-2.1.1']
require ['javascript/circle']
require ['javascript/entity']
require ['javascript/line']
require ['javascript/path']
require ['javascript/play_button']
require ['javascript/universe']
require ['javascript/vector']
require ['javascript/runner'], ->
  runner = new Runner document.getElementById 'canvas'
  playButton = new PlayButton runner
