Gravity simulator.

Built with
* coffeescript

Fixme
* Default 'Earth' entity seems to behave strangely when a third body is added. Force calc bug?
  -> Changing the velocity from -100 to -20 (as are the others' defaults) makes it act normal.
    -> Why does this happen? Should it? I wouldn't think so. It seems it's getting a
       greater force due to it's velocity. Am I missing a normalization somewhere?

ToDo/Ideas
* Basic styling
* Better pause behavior
  - Input listeners should force redraw so that changes can be seen when paused
  - Make it so you can add entities while the thing is paused (and then change their values)
* Add label displaying force, dt, any other interesting values

* Real values. Decide on a suitable scale (how many meters per pixel?)

* Tails should start at edge of circle, not center

Future
* When paused, show arrow indicating direction? Make it dragable to change velocity?
* Predefined setups (sun earth moon, dual star, solar system?, 3 body, etc)
* Predefined entities (our sun, earth, planets, black holes?, other types of stars?)
* Optimize entity paths
* Remove entities way too far off screen
