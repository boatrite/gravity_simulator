require ['javascript/circle']
require ['javascript/configures_preset_entities']
require ['javascript/entity']
require ['javascript/global']
require ['javascript/line']
require ['javascript/listeners/entity_inputs']
require ['javascript/listeners/simulator_controls']
require ['javascript/listeners/space_click_listener']
require ['javascript/listeners/space_dimension_inputs']
require ['javascript/listeners/universe_constants_inputs']
require ['javascript/monkeypatch']
require ['javascript/path']
require ['javascript/universe']
require ['javascript/vector']
require ['lib/jquery-2.1.1', 'javascript/runs_simulation'], ->
  presetEntities = ConfiguresPresetEntities.sunAndPlanet()
  universe = new Universe()
  universe.addEntities presetEntities

  runner = new RunsSimulation universe

  new SimulatorControls runner
  new SpaceClickListener universe
  new SpaceDimensionInputs()
  new UniverseConstantsInputs()
