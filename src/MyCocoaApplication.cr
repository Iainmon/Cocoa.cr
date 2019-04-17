require "./cocoa/*"
require "./app/delegates/**"
require "./app/ui/*"

module MyCocoaApplication

  VERSION = Cocoa::APP_CONFIG["version"]

  maindelegate = Delegates::AppDelegate.new

  ui = UserInterface::MainUserInterfaceHandler.new
  ui.load_events maindelegate.@uiEvents
  ui.load_ui_action_callbacks maindelegate.@uiOptions
  ui.render()

  warn "#{Time.now.to_s} | Application killed."

end
