module OrangeZest::UI
  # A mixin which enables an object to show a tooltip when hovered.
  #
  # The object must have a method named `#bounding_box` which returns a `Box`. Then, your component
  # should call `#draw_tooltip` during `#draw`, which will display the tooltip if the mouse cursor
  # is within the bounding box.
  module Tooltip
    # An optional tooltip to display when the button is hovered. The tooltip may have multiple
    # lines.
    attr_accessor :tooltip

    # Draws the tooltip if the object is being hovered. If a block is passed, the block is executed
    # after the tooltip is drawn.
    # @param [Gosu::Font, nil] font The font to use to draw the tooltip, or nil to use
    #   `OrangeZest::UI.default_font`.
    def draw_tooltip(font: nil, &block)
      font = UI.default_font! unless font

      if tooltip && bounding_box.point_inside?(Input.cursor)
        # Find how tall the tooltip needs to be
        lines = tooltip.split("\n")
        text_width = lines.map { |l| font.text_width(l) }.max
        text_height = lines.length * font.height

        # Draw rectangle with some padding, clamp to edges of screen
        padding = 10
        origin_x = [Input.cursor.x, Window.current.width - (text_width + padding * 2)].min
        origin_y = [Input.cursor.y, text_height + padding * 2].max
        Gosu.draw_rect(
          origin_x, origin_y - text_height - padding * 2,
          text_width + padding * 2, text_height + padding * 2,
          Gosu::Color.argb(0xDD, 0x00, 0x00, 0x00), 1000,
        )
        font.draw_text(
          tooltip, origin_x + padding, origin_y - text_height - padding, 1000, 1, 1,
          Gosu::Color::WHITE,
        )

        block&.()
      end
    end
  end
end
