require ['javascript/circle']
require ['javascript/entity']
require ['javascript/universe']
require ['javascript/vector']
require ['javascript/runner'], ->
  runner = new Runner document.getElementById 'canvas'
