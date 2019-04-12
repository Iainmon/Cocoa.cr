#include Hedron

module Windows

  class MainWindow < Cocoa::ViewController

    # This implamentation does not work
    def draw

      # Gets the default window name option from config/App.yml
      windowName = Cocoa::CONFIG["app"]["ui"]["default_window_name"].to_s

      # Window dimensions
      windowWidth = 640
      windowHeight = 480

      # Initializes an action to prevent runtime errors
      @actions = { "SampleAction" => ->{ puts "Hello World!" } } if @actions.nil?

      # Creates a Window object
      @window = Hedron::Window.new(
          windowName,
          {windowWidth, windowHeight},
          menubar: true
        )
      @window.not_nil!.on_close = ->on_closing(Hedron::Window) if Cocoa::UI_CONFIG["quit_on_close"].to_s == "true"

      # Creates a Grid object
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
      @window.not_nil!.show
    end
  end
end
