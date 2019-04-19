
module Cocoa

  alias UIObject = Hedron::Button | Hedron::Label

  class UIAction

    @callback : Proc(UIObject, Nil | Void)

    def initialize(@callback : Proc(UIObject, Nil | Void)); end

  end
end
