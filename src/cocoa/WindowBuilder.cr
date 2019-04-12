module Cocoa
  class WindowBuilder

    def self.build(actions : Hash(String, Proc(Nil))) : Hedron::Window
      return Window.new((CONFIG["app"]["ui"]["default_window_name"]).to_s, {640, 480}, menubar: true)
    end

  end
end
