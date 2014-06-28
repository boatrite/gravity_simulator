require ['javascript/circle']
require ['javascript/entity']
require ['javascript/line']
require ['javascript/path']
require ['javascript/universe']
require ['javascript/vector']
require ['javascript/runner'], ->
  runner = new Runner document.getElementById 'canvas'
