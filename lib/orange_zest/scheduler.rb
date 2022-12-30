module OrangeZest
  # Provides utilities for starting a task which persists across multiple updates. Tasks can suspend
  # themselves for a fixed number of frames.
  #
  # The order in which resumed tasks run is not guaranteed. Tasks are not processes/threads and do
  # not run asynchronously.
  module Scheduler
    @@pending = []

    WaitResult = Struct.new('WaitResult', :time)

    # Starts a new task, which executes the given block, and executes it until its first
    # {Schedular.wait} call.
    #
    # If a task terminates without ever waiting, an exception is thrown, since this is likely a bug.
    def self.start(&block)
      fiber = Fiber.new(&block)
      result = fiber.resume
      raise 'Scheduler task never waited' unless result.is_a?(WaitResult)
      @@pending << [result.time, fiber]
      nil
    end

    # Suspends the current task (started with {Scheduler.start}) for a given number of frames. 
    # @param [Integer] ticks The number of frames to suspend for.
    def self.wait(ticks)
      Fiber.yield(WaitResult.new(ticks))
    end

    # Advance all suspended tasks by one frame. Called automatically by {OrangeZest::Window.update}.
    def self.update
      @@pending.map! do |(time, task)|
        time = time - 1
        if time <= 0
          result = task.resume
          if result.is_a?(WaitResult)
            [result.time, task]
          else
            nil
          end
        else
          [time, task]
        end
      end
      @@pending.compact!
    end
  end
end
