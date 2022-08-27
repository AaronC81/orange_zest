module OrangeZest
  # An object which can exist in the game world, and responds to Gosu's `#update` and `#draw`
  # methods.
  class Component
    # Called during Gosu's update phase. A stub to be overridden.
    def update; end

    # Called during Gosu's draw phase. A stub to be overridden.
    def draw; end

    # Adds this component to a group. If no group is given, uses the `Main` group.
    # Returns `self` so you can chain this with an assignment.
    # @param [Group, nil] group
    # @return [Component] Itself.
    def register(group=nil)
      (group || Group::Main).add(self)
      self
    end
  end
end
