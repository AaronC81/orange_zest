module OrangeZest
  module UI
    class << self
      attr_accessor :default_font
    end

    def self.default_font!
      raise "tried to fall back to default font, but none is set" if default_font.nil?
      default_font
    end
  end
end

require_relative "ui/tooltip"
