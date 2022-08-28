require 'gosu'
require 'orange_zest'

include OrangeZest

WIDTH = 640
HEIGHT = 480

# First, we'll define a component responsible for clearing the screen. Components can define 
# `#update` and `#draw` to perform actions during Gosu's update and draw steps.
class ClearScreen < Component
  def draw
    Gosu.draw_rect(0, 0, WIDTH, HEIGHT, Gosu::Color::WHITE)
  end
end

# Now we'll define an entity, a special kind of component with a position and animation system.
class BouncingBall < Entity
  IMAGE = Gosu::Image.new(File.join(__dir__, "res", "ball.png"))
  SPEED = 5

  def initialize(**kw)
    super(
      # Our "animation" is just a single frame, so we can use the `Animation.static` helper to
      # create it easily.
      # We've named this animation `:normal` - these names are used to switch between animations
      # later if you've got more than one.
      # However, we don't need to worry about that here - the first animation is started by default
      # when the entity is created.
      animations: {
        normal: Animation.static(IMAGE)
      },
      **kw
    )

    @velocity = [SPEED, SPEED]
  end

  # Override `#update` to implement our bouncy-ball logic by updating the entity's position
  # (Remember to call `super`, or animations won't work as expected!)
  def update
    super

    # Move the ball
    position.x += @velocity[0]
    position.y += @velocity[1]

    # Bounce if we've hit left or right walls
    # (`#image` retrives the current animation frame)
    if position.x <= 0
      @velocity[0] = SPEED
    elsif position.x + image.width >= WIDTH
      @velocity[0] = -SPEED
    end

    # Bounce if we've hit top or bottom walls
    if position.y <= 0
      @velocity[1] = SPEED
    elsif position.y + image.height >= HEIGHT
      @velocity[1] = -SPEED
    end
  end
end

# Now we can define our window - `OrangeZest::Window` is a subclass of `Gosu::Window` which makes
# our life easier.
class Game < OrangeZest::Window
  def initialize
    super WIDTH, HEIGHT

    # Instantiate our components, and call `#register` to add them to the main group.
    # Groups are components which can contain other components.
    # Components fire in the order they are registered, so we must register `ClearScreen` first.
    ClearScreen.new.register
    BouncingBall.new(position: Point.new(50, 50)).register
  end

  # There's nothing else to do!
  # We added our components to the main group, and one of the key things that `OrangeZest::Window` 
  # does is to update and draw this group for us.
  # The main group always exists and is the default for `#register`, but you can create more groups
  # and manage them manually if you need to. `#register` can take a different group as an argument.
end

# Let's go!
Game.new.show
