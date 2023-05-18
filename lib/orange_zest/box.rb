module OrangeZest
  # A box, with an origin in the top-left corner.
  class Box
    def initialize(origin, width, height)
      @origin = origin
      @width = width
      @height = height
    end 

    attr_accessor :origin, :width, :height

    # Returns true if this box overlaps another box.
    def overlaps?(other)
      self.origin.x < other.origin.x + other.width \
      && other.origin.x < self.origin.x + self.width \
      && self.origin.y < other.origin.y + other.height \
      && other.origin.y < self.origin.y + self.height
    end

    # Returns true if a point is inside this box.
    # @return [Boolean]
    def point_inside?(point)
      point.x >= origin.x && point.x <= origin.x + width \
      && point.y >= origin.y && point.y <= origin.y + height
    end

    # Returns the point at the centre of this box.
    # @return [Point]
    def centre
      origin + Point.new(width / 2, height / 2)
    end
    alias center centre
  end
end
