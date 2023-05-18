# A tiny example which can be used as a starting point - simply clears the screen to black using
# an anonymous component.
#
# (See `basic.rb` if you'd like something more of a tutorial!)

require 'gosu'
require 'orange_zest'

include OrangeZest

class Game < OrangeZest::Window
  WIDTH, HEIGHT = [640, 480]

  def initialize
    super WIDTH, HEIGHT
    Component
      .anon(draw: ->{ Gosu.draw_rect(0, 0, WIDTH, HEIGHT, Gosu::Color::BLACK) })
      .register
  end
end

Game.new.show
