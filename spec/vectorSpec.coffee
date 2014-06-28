describe "Vector", ->

  describe "#add", ->
    it "adds the vector with another", ->
      vector = new Vector(2, 2)
      other = new Vector(1, 3)
      actual = vector.add other
      expect(actual.x).toEqual 3
      expect(actual.y).toEqual 5

  # TODO Rest of specs
