include Cocoa

module Delegates

  class AppDelegate < ApplicationDelegate

    def create_ui_events
      @uiEvents.will_start ->{
        puts "Starting..."
      }
      @uiEvents.will_terminate ->{
        puts "Terminating..."
      }
      @uiEvents.did_terminate ->{
        puts "Terminated!"
      }
    end

    def create_ui_options
      @uiOptions = {
        "action1" => ->{
          puts "Action 1 fired!"
        },
        "AlertWhenDone" => ->{
          puts "Wget complete!"
        },
      }
    end
  end
end
