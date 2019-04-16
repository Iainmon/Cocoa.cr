module UserInterface
  class MainUserInterfaceHandler < Cocoa::UserInterfaceHandler

    def initialize
      # This is sets wich window is your main window.
      @window = Windows::MainWindow.new
    end

  end
end
