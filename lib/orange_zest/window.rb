module OrangeZest
  # A subclass of `Gosu::Window` which overrides a variety of default methods in order to:
  #   - Draw and update the main group
  #   - Update and provide inputs to `OrangeZest::Input`
  class Window < Gosu::Window
    def self.current
      @@current
    end

    def initialize(*args)
      super(*args)
      raise "OrangeZest only supports one window" if defined? @@current
      @@current = self
    end

    def update
      super
      Group::Main.update
      Input.update(self)
    end

    def draw
      super
      Group::Main.draw
    end

    def button_down(id)
      super
      Input.button_down(id)
    end
  end
end
