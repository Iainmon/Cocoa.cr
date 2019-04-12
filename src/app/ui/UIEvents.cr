class UIEvents

    @will_start_callback : Proc(Void) = ->{}

    @will_terminate_callback : Proc(Void) = ->{}
    @did_terminate_callback : Proc(Void) = ->{}

    def initialize
    end

    def will_start (block : Proc(Void)) 
        @will_start_callback = block
    end

    def will_terminate (block : Proc(Void)) 
        @will_terminate_callback = block
    end
    def did_terminate (block : Proc(Void)) 
        @did_terminate_callback = block
    end

end