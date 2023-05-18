module OrangeZest
  # A point in the game's world.
  class Point
    attr_accessor :x, :y, :z

    def initialize(x, y, z = 0)
      @x = x
      @y = y
      @z = z
    end

    def self.[](*args)
      new(*args)
    end

    def +(other)
      case other
      when Point
        Point.new(x + other.x, y + other.y, z + other.z)
      when Numeric
        Point.new(x + other, y + other, z + other)
      else
        raise TypeError, "can't add point to #{other}"
      end
    end
    
    def -@
      Point.new(-x, -y, -z)
    end

    def -(other)
      self + -other
    end

    def ==(other)
      other.is_a?(Point) &&
        x == other.x &&
        y == other.y &&
        z == other.z
    end

    def hash
      [x, y, z].hash
    end

    def to_s
      "#<Point: #{x}, #{y}, #{z}>"
    end
    alias inspect to_s

    # Computes the distance between this point and another.
    def distance(other)
      x_dist = (x - other.x)
      y_dist = (y - other.y)
      Math.sqrt(x_dist**2 + y_dist**2)
    end

    # Return all points in a line from one point to another.
    # @param [Point] other
    # @return [<Point>]
    def line_to(other)
      # `supercover_line` from: https://www.redblobgames.com/grids/line-drawing.html
      dx = other.x - self.x
      dy = other.y - self.y
      nx = dx.abs
      ny = dy.abs
      sign_x = dx <=> 0
      sign_y = dy <=> 0

      p = self.clone
      points = [p.clone]
      
      ix = 0
      iy = 0
      while ix < nx || iy < ny
        decision = (1 + 2*ix) * ny - (1 + 2*iy) * nx
        if decision == 0
          p.x += sign_x
          p.y += sign_y
          ix += 1
          iy += 1
        elsif decision < 0
          p.x += sign_x
          ix += 1
        else
          p.y += sign_y
          iy += 1
        end
        points << p.clone
      end

      points
    end  
  end
end
