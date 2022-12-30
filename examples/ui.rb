require 'gosu'
require 'orange_zest'

include OrangeZest

WIDTH = 640
HEIGHT = 480

class ClearScreen < Component
  def draw
    Gosu.draw_rect(0, 0, WIDTH, HEIGHT, Gosu::Color::WHITE)
  end
end

class BouncingBall < Entity
  IMAGE = Gosu::Image.new(File.join(__dir__, "res", "ball.png"))

  include UI::Tooltip

  def initialize(**kw)
    super(animations: { normal: Animation.static(IMAGE) }, **kw)
    @tooltip = "Hello"
  end

  def draw
    super
    draw_tooltip
  end
end

class Game < OrangeZest::Window
  def initialize
    super WIDTH, HEIGHT

    UI.default_font = Gosu::Font.new(16, name: "Arial")

    ClearScreen.new.register
    BouncingBall.new(position: Point.new(50, 50)).register
  end
end

# Let's go!
Game.new.show
