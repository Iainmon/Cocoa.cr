module Cocoa
  class ApplicationDelegate
    @uiEvents = UIEvents.new
    @uiOptions : Hash(String, Proc(Nil)) = {
      String.new => ->{},
    }

    def initialize
      create_ui_settings
    end

    def create_ui_settings
      create_ui_events
      create_ui_options
    end

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
        "TestOutput" => ->{
          puts "#{Time.now.to_s} | 'TEST OUTPUT DELEGATE ACTION' fired!"
        },
      }
    end

  end
end
