require "./windows/MainWindow"

module UserInterface
  class UserInterfaceHandler
    @events : Cocoa::UIEvents = Cocoa::UIEvents.new

    def initialize
      @window = Windows::MainWindow.new
    end

    def render
      @window.draw

      @events.@will_start_callback.call
      @window.start

      @events.@will_terminate_callback.call
      @window.close
      @events.@did_terminate_callback.call
    end

    def load_events(events : Cocoa::UIEvents)
      @events = events
    end

    def load_ui_action_callbacks(action_callbacks : Hash(String, Proc(Nil)))
      @window.load_action_callbacks action_callbacks
    end
  end
end
