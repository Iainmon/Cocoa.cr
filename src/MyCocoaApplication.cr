require "./cocoa/*"
require "./app/program/MainDelegate"
require "./app/ui/UserInterface"

module MyCocoaApplication

  VERSION = Cocoa::CONFIG

  maindelegate = MainDelegate.new

  ui = UserInterface.new
  ui.load_events maindelegate.@uiEvents
  ui.load_ui_action_callbacks maindelegate.@uiOptions
  ui.render()

  puts "#{Time.now.to_s} | Application stopped."

end
