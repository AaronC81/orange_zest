module OrangeZest
  # An animation which can be attached to an `Entity`.
  class Animation
    # The number of ticks to display each frame for. If -1, the current frame will be displayed
    # forever.
    # @return [Integer]
    attr_accessor :ticks_per_image

    # The images to cycle through as part of this animation.
    # @return [<Gosu::Image>]
    attr_accessor :images

    def initialize(images, ticks_per_image)
      @images = images
      @ticks_per_image = ticks_per_image
  
      reset
    end
  
    # A helper method to create an animation with a single static frame.
    # @param [Gosu::Image] image
    def self.static(image)
      new([image], -1)
    end

    # A helper method to create a placeholder animation, with a single frame of static colour in a
    # chosen size.
    # @param [Numeric] width
    # @param [Numeric] height
    # @param [Gosu::Color] colour
    # @return [Animation]
    def self.placeholder(width, height, colour)
      image = Gosu.render(width, height) do
        Gosu.draw_rect(0, 0, width, height, colour)
      end
      Animation.static(image)
    end  

    # Resets this animation to its first frame.
    def reset
      @ticks = 0
      @image_idx = 0
    end
  
    # Ticks this animation, advancing it to the next frame if enough ticks have passed.
    # (Despite implementing this method, this is not a `Component`, as it does not make sense for
    # it to exist on its own.)
    def update
      return if @ticks_per_image == -1
  
      @ticks += 1
      if @ticks >= @ticks_per_image
        @image_idx += 1
        @image_idx %= @images.length
        @ticks = 0
      end
    end
  
    # The current frame.
    # @return [Gosu::Image]
    def image
      @images[@image_idx]
    end
  end
end
