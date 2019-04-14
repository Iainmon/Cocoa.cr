require "./cocoa/*"
require "./app/program/*"
require "./app/ui/*"
require "./app/ui/windows/MainWindow"

module MyCocoaApplication

  VERSION = Cocoa::CONFIG["app"]["metadata"]["version"]

  maindelegate = Delegates::AppDelegate.new

  ui = UserInterface::MainUserInterfaceHandler.new
  ui.load_events maindelegate.@uiEvents
  ui.load_ui_action_callbacks maindelegate.@uiOptions
  ui.render()

  warn "#{Time.now.to_s} | Application killed."

end
