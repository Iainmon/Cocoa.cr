#
# AppDelegate.cr
# This is where all of the logic of your application will happen.
# All delegates should be created in this folder, and be defined in the 'Delegates' module
#

include Cocoa

module Delegates

  class AppDelegate < ApplicationDelegate

    def create_ui_events
      @uiEvents.will_start ->{
        info "Starting #{APP_CONFIG["app_name"]}..."
        application_will_start
      }
      @uiEvents.will_terminate ->{
        info "Terminating #{APP_CONFIG["app_name"]}..."
        application_will_terminate
      }
      @uiEvents.did_terminate ->{
        info "Terminated!"
        application_did_terminate
      }
    end

    def create_ui_options

      # Define any UI callbacks that will be loaded into the window for use.
      @uiOptions = {
        "action_1" => ->{
          log "Action 1 fired!"
        },
        "action_2" => ->{
          ui_callback_example
        },
      }

    end

    def ui_callback_example

    end


    def application_will_start
      # Any setup for your application will go here.
      # After this, it is all callbacks and fibers...

    end

    def application_will_terminate
      # Any kind of houskeeping that needs to be done before the window is closed.

    end

    def application_did_terminate
      # The window is closed, this will run last.

    end
  end
end
