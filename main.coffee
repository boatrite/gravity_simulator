require ['javascript/circle']
require ['javascript/entity']
require ['javascript/global']
require ['javascript/line']
require ['javascript/listeners/entity_inputs']
require ['javascript/listeners/g_input']
require ['javascript/listeners/play_button']
require ['javascript/listeners/space_click_listener']
require ['javascript/listeners/space_dimension_inputs']
require ['javascript/monkeypatch']
require ['javascript/path']
require ['javascript/universe']
require ['javascript/vector']
require ['lib/jquery-2.1.1', 'javascript/runner'], ->
  runner = new Runner
  new SpaceClickListener runner.universe
  new SpaceDimensionInputs()
