Gravity simulator.

Built with
* coffeescript

Fixme
* Default 'Earth' entity seems to behave strangely when a third body is added. Force calc bug?
  -> Changing the velocity from -100 to -20 (as are the others' defaults) makes it act normal.

ToDo/Ideas
* Position, velocity input fields should update with current values as simulation is run
* Make it so you can add entities while the thing is paused (and then change their values)
* Change canvas height, width with inputs
* Tails should start at edge of circle, not center

Future
* When paused, show arrow indicating direction? Make it dragable to change velocity?
* Predefined setups (sun earth moon, dual star, solar system?, 3 body, etc)
* Predefined entities (our sun, earth, planets, black holes?, other types of stars?)
* Optimize entity paths
