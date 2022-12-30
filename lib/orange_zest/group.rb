require_relative 'component'

module OrangeZest
  # Wraps a collection of `Component`s into a single `Component`.
  #
  # The associated instance within this class, `Main`, is a special group available everywhere which
  # components can be added to easily.
  class Group < Component
    # The items within this group.
    # @return [<Component>]
    attr_accessor :items

    def initialize
      @items = []
      @enabled = true
    end

    # Whether to call `#update` or `#draw` on the items in this group. 
    # @return [Boolean]
    attr_accessor :enabled
    alias enabled? enabled

    # Adds a component to this group.
    # @param [Component] component
    def add(component)
      @items << component
    end
    alias << add

    # Removes a component from this group.
    # @param [Component] component
    def remove(component)
      @items.delete(component)
    end
    alias delete remove

    def update
      return unless enabled?
      items.each(&:update)
    end

    def draw
      return unless enabled?
      items.each(&:draw)
    end

    Main = new
  end
end
