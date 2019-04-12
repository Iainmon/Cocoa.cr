#require "./windows/MainWindow"
require "./windows/RenderedWindow"

class UserInterface

    @events : UIEvents = UIEvents.new

    def initialize
        #@window = MainWindow.new
        @window = RenderedWindow.new
    end

    def render

        @window.draw

        @events.@will_start_callback.call
        @window.start

        @events.@will_terminate_callback.call
        @window.close
        @events.@did_terminate_callback.call
    end

    def load_events(events : UIEvents)
        @events = events
    end

    def load_ui_action_callbacks(action_callbacks : Hash(String, Proc(Nil)))
        @window.load_action_callbacks action_callbacks
    end
end