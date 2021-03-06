require ['javascript/circle']
require ['javascript/configures_preset_entities']
require ['javascript/dom/entity_container']
require ['javascript/dom/entity_dom_elements']
require ['javascript/dom/entity_functions']
require ['javascript/dom/entity_properties']
require ['javascript/dom/simulator_controls']
require ['javascript/dom/space_click_listener']
require ['javascript/dom/space_drag_listener']
require ['javascript/dom/space_dimension_inputs']
require ['javascript/dom/space_refresh_listener']
require ['javascript/dom/universe_constants_inputs']
require ['javascript/entity']
require ['javascript/global']
require ['javascript/line']
require ['javascript/monkeypatch']
require ['javascript/path']
require ['javascript/universe']
require ['javascript/vector']
require ['lib/underscore', 'lib/jquery-2.1.1', 'javascript/runs_simulation'], ->
  canvas().height = 500
  canvas().width = 1000

  presetEntities = ConfiguresPresetEntities.sunAndPlanet()
  universe = new Universe
  universe.addEntities presetEntities

  runner = new RunsSimulation universe

  new SimulatorControls runner
  new SpaceClickListener universe
  new SpaceDragListener universe
  new SpaceRefreshListener universe
  new SpaceDimensionInputs
  new UniverseConstantsInputs
