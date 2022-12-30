module OrangeZest
  # An object which can exist in the game world, and responds to Gosu's `#update` and `#draw`
  # methods.
  class Component
    # The group which this component is registered with, if any.
    # @return [Group, nil]
    attr_reader :group

    # Called during Gosu's update phase. A stub to be overridden.
    def update; end

    # Called during Gosu's draw phase. A stub to be overridden.
    def draw; end

    # Adds this component to a group. If no group is given, uses the `Main` group.
    # Returns `self` so you can chain this with an assignment.
    # @param [Group, nil] group
    # @return [Component] Itself.
    def register(group=nil)
      group ||= Group::Main
      group.add(self)
      @group = group
      self
    end

    # Removes this component from its group.
    def unregister
      raise 'tried to unregister component which is not registered' unless group
      group.remove(self)
    end
  end
end
