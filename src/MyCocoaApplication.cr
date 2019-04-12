require "./app/program/MainDelegate"
require "./app/ui/UserInterface"


module MyCocoaApplication
  VERSION = "0.1.0"

  maindelegate = MainDelegate.new

  ui = UserInterface.new
  ui.load_events maindelegate.@uiEvents
  ui.load_ui_action_callbacks maindelegate.@uiOptions
  ui.render()


end
