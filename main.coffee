require ['javascript/circle']
require ['javascript/entity']
require ['javascript/g_input']
require ['javascript/line']
require ['javascript/listeners/entity_inputs']
require ['javascript/listeners/g_input']
require ['javascript/listeners/play_button']
require ['javascript/path']
require ['javascript/universe']
require ['javascript/vector']
require ['lib/jquery-2.1.1', 'javascript/runner'], ->
  runner = new Runner document.getElementById 'space'
