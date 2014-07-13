Gravity simulator.

Fixme
* Separate draw updates from logic updates
* Optimize force calculations (benchmark first)
* Tails should start at edge of circle, not center
* Larger mass input

ToDo/Ideas
* Better pause behavior
  - Input listeners should force redraw so that changes can be seen when paused
  - Make it so you can add entities while the thing is paused (and then change their values)
* Real values. Decide on a suitable scale (how many meters per pixel?)
* Should probably start paused


Future
* Benchmark and try optimize entity paths (not as important as force optimization)
* Better styling
* Click and drag to view more space (infinite size?)
* Merge entities that collide? (Instead of having them shoot off to infinity)
* Predefined entities (our sun, earth, planets, black holes?, other types of stars?)
* Predefined setups (sun earth moon, dual star, solar system?, 3 body, etc)
* Remove entities way too far off screen
* When paused, show arrow indicating direction? Make it dragable to change velocity?
