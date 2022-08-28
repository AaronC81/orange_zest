module OrangeZest
  # Holds some input state so that it can be globally accessed.
  #
  # In Gosu, the mouse cursor position is only available to the `Gosu::Window`, which makes it
  # tricky to break the UI into components. This module stores and shares the cursor position for
  # global access.
  module Input
    # Should be called from your `Gosu::Window#button_down` implementation. Updates `.click?`.
    # @param [Integer] id The keycode pressed.
    def self.button_down(id)
      @click = (id == Gosu::MS_LEFT)
    end

    # Should be called from your `Gosu::Window'#update` implementation. Updates `.cursor`.
    # @param [Gosu::Window] window The window this is being called from.
    def self.update(window)
      @cursor = Point.new(window.mouse_x, window.mouse_y)
    end
    
    # The mouse cursor position within the window.
    def self.cursor
      @cursor
    end

    # Whether the left mouse button was clicked this frame. Even if the mouse is held down, this
    # will only be `true` for the first frame of the click.
    def self.click?
      @click
    end

    # Clears the click registered this frame, if any. This can be used to ensure that a click is
    # only seen by one UI element.
    def self.clear_click
      @click = false
    end 
  end
end
