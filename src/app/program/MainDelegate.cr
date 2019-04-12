require "../ui/UIEvents"

class MainDelegate

    @uiEvents = UIEvents.new
    @uiOptions : Hash(String, Proc(Nil)) = {
        String.new => ->{}
    }

    def initialize
        create_ui_settings
    end

    def create_ui_settings
        @uiEvents.will_start ->{puts "Starting..."}
        @uiEvents.will_terminate ->{puts "Terminating..."}
        @uiEvents.did_terminate ->{puts "Terminated!"}

        @uiOptions = {
            "action1" => ->{puts "Action 1 fired!"},
            "AlertWhenDone" => ->{puts "Wget complete!"}
        }
    end

end