class @EntityContainer
  constructor: (entity) ->
    @name = entity.name
    @addElements()

  addElements: =>
    containerHTML = "
      <div class='entity #{@name}'>
        <h1>#{@name.capitalize()}</h1>
      </div>
    "
    $('.entities-container').append containerHTML
