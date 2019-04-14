require "./windows/MainWindow"

module UserInterface
  class MainUserInterfaceHandler < Cocoa::UserInterfaceHandler

    def initialize
      @window = Windows::MainWindow.new
    end

    def render

      @window.window_setup
      @window.build
      @window.draw

      @events.@will_start_callback.call
      @window.start

      @events.@did_terminate_callback.call
    end

  end
end
