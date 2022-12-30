require_relative 'animation'
require_relative 'point'
require_relative 'box'

module OrangeZest
  # A subclass of `Component` with associated size, position, and animation information.
  class Entity < Component
    # The position of this object.
    # @return [Point]
    attr_accessor :position
    
    # The animations which this object can perform.
    # @return [{Object => Animation}]
    attr_accessor :animations
    
    # The scaling of this entity.
    # @return [Numeric]
    attr_accessor :scaling
    
    # Whether this object should be mirrored along its X axis. Useful for flipping animations when
    # creating a game with a 2D character.
    # @return [Boolean]
    attr_accessor :mirror_x
    
    # The rotation of this entity.
    # @return [Numeric]
    attr_accessor :rotation
    
    # The opacity of this entity. 255 is fully opaque, and 0 is fully transparent.
    # @return [Integer]
    attr_accessor :opacity

    def initialize(position: nil, animations: nil, scaling: nil)
      @position = position || Point.new(0, 0)
      @animations = animations || {}
      @scaling = scaling || 1
      @rotation = 0
      @opacity = 255

      if animations.any?
        @current_animation_name, @current_animation = animations.first
      end

      @mirror_x = false
    end

    # Retrieve the current frame of the currently-playing animation.
    def image
      @current_animation&.image
    end

    # Begin playing the animation with the given name, from the beginning.
    # Raises an exception if an animation with that name does not exist in `#animations`.
    # @param [Object] anim_name The name of the animation to begin, which should be a key in
    #   `#animations`.
    def animation=(anim_name)
      return if @current_animation_name == anim_name

      @current_animation = @animations[anim_name]
      @current_animation_name = anim_name
      raise "no animation named #{anim_name}" if !@current_animation

      @current_animation.reset
    end

    # @override
    def update
      @current_animation&.update
    end

    # @override
    def draw
      return unless image

      image.draw_rot(
        position.x + (mirror_x ? image.width * scaling : 0), position.y, position.z,
        rotation, 0, 0,
        scaling * (mirror_x ? -1 : 1),
        scaling,
        Gosu::Color.new(opacity * 255, 255, 255, 255),
      )
    end

    # Returns a bounding box for this entity, starting at its position and spanning the size of its
    # current frame.
    def bounding_box
      Box.new(position, image.width, image.height)
    end
  end
end
