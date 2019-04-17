module Cocoa
  class UserInterfaceHandler

    @events : UIEvents = UIEvents.new

    def initialize
      @window = ViewController.new
    end

    def render

      @window.window_setup
      @window.build
      @window.draw

      @events.@will_start_callback.call
      @window.start

      @events.@did_terminate_callback.call
    end

    def load_events(events : UIEvents)
      @events = events
      @window.load_ui_action_callbacks events
    end

    def load_ui_action_callbacks(action_callbacks : Hash(String, Proc(Nil)))
      @window.load_action_callbacks action_callbacks
    end
  end
end
