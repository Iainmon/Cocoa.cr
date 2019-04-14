require "hedron"

module Cocoa
  class ViewController < Hedron::Application

    @window : Hedron::Window?

    @events : UIEvents = UIEvents.new

    @actions : Hash(String, Proc(Nil)) = { "SampleAction" => ->{ puts "Hello World!" } }

    # Window dimensions
    @windowWidth : Int32 = 640
    @windowHeight : Int32 = 480

    # Gets the default window name option from config/App.yml
    @windowName : String = Cocoa::CONFIG["app"]["ui"]["default_window_name"].to_s

    @hasMenuBar = false

    def initialize
      options = UI::InitOptions.new
      err = UI.init(pointerof(options))
      unless ui_nil?(err)
        raise Hedron::UIError.new("Error initializing UI: #{String.new(err)}")
      end

      self.on_stop = ->should_quit

    end

    def load_ui_action_callbacks(events : UIEvents)
      @events = events
    end

    def load_action_callbacks(callbacks : Hash(String, Proc(Nil)))
      @actions = callbacks
    end

    def on_closing(this)
      should_quit
      self.stop
      return false
    end

    def should_quit
      @events.@will_terminate_callback.call
      return true
    end


    def window_setup

      # Initializes an action to prevent runtime errors
      @actions = { "SampleAction" => ->{ puts "Hello World!" } } if @actions.nil?

      # Creates a Window object
      @window = Hedron::Window.new(
          @windowName,
          {@windowWidth, @windowHeight},
          menubar: @hasMenuBar
        )

      @window.not_nil!.on_close = ->on_closing(Hedron::Window) if Cocoa::UI_CONFIG["quit_on_close"].to_s == "true"

    end

    def build

      grid = Hedron::Grid.new
      grid.padded = true

      cell_info = Hedron::GridCell.new(
        size: {1, 1},
        expand: {false, false},
        align_x: :fill,
        align_y: :fill
      )

      grid.push(Hedron::Label.new("Name"), {0, 0}, cell_info)
      grid.push(Hedron::Label.new("Button"), {0, 1}, cell_info)
      grid.push(Hedron::Label.new("Age"), {0, 2}, cell_info)

      name = Hedron::Entry.new
      name.text = "Qwerp"
      grid.push(name, {1, 0}, cell_info)

      button = Hedron::Button.new("My Button")
      button.on_click { @actions.["action1"].call }
      grid.push(button, {1, 1}, cell_info)

      age = Hedron::Slider.new({0, 100})
      age.value = 40
      grid.push(age, {1, 3}, cell_info)

      @window.not_nil!.child = grid
    end

    def set_root(root)
      @window.not_nil!.child = root
    end

    def draw
      @window.not_nil!.show
    end

  end
end
