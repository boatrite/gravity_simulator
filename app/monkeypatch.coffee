Number.prototype.randSign =  ->
  (if Math.random() < 0.5 then 1 else -1) * this

Number.prototype.floor = ->
  +Math.round this

String.prototype.capitalize = ->
  @charAt(0).toUpperCase() + @slice(1)

String.prototype.toInt = ->
  parseInt this, 10

