module OrangeZest
  # Allows wrapping a boolean condition to monitor it for changes.
  module TriggerCondition
    ON = :on
    OFF = :off

    @@states = {}
    
    # Watches the given boolean condition, and returns:
    #
    # - {TriggerCondition::ON} if the condition was previously false, and becomes true
    # - {TriggerCondition::OFF} if the condition was previously true, and becomes false
    # - `nil` if the condition has not changed
    #
    # Conditions are assumed to be false on the first call. 
    #
    # Each separate condition is identified by its source file and line number, which means you
    # **must not watch more than one condition on a single line**.
    #
    # @param [Boolean] condition The condition to watch.
    # @return The change in condition, if it has changed.
    def self.watch(condition)
      c = caller.first
      triggered = @@states[c]
      
      if (!condition && !triggered) || (condition && triggered)
        nil
      elsif condition && !triggered
        @@states[c] = true
        TriggerCondition::ON
      elsif !condition && triggered
        @@states[c] = false
        TriggerCondition::OFF
      else
        raise 'unexpected condition case'
      end
    end
  end
end
