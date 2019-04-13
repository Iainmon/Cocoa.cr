include Cocoa

module Delegates

  class AppDelegate < ApplicationDelegate

    def create_ui_events
      @uiEvents.will_start ->{
        info "Starting #{APP_CONFIG["app_name"]}..."
      }
      @uiEvents.will_terminate ->{
        info "Terminating #{APP_CONFIG["app_name"]}..."
      }
      @uiEvents.did_terminate ->{
        info "Terminated!"
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
