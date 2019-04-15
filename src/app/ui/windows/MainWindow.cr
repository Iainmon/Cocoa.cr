include Cocoa::Debug

module Windows

  class MainWindow < Cocoa::ViewController

    # Window dimensions
    @windowWidth : Int32 = 200
    @windowHeight : Int32 = 250

    # Gets the default window name option from config/App.yml
    @windowName : String = Cocoa::CONFIG["app"]["ui"]["default_window_name"].to_s

    @hasMenuBar = false

    # This implamentation does not work
    def build

      root = Hedron::Group.new(Cocoa::APP_CONFIG["app_name"].to_s)
      root.margined = true

      # Creates a Grid object
      grid = Hedron::Grid.new
      grid.padded = true

      # Creates a template for all the grid cells
      cell_info = Hedron::GridCell.new(
        size: {2, 2},
        expand: {false, false},
        align_x: :fill,
        align_y: :fill
      )

      # Creates a text entery object, with a callback that logs the value enytime there is a change
      name = Hedron::Entry.new
      name.text = "Iain Moncrief"
      name.on_change = ->(entry : Hedron::Entry) {
        log entry.text
      }

      # Creates a button with a callback that executes every time it is clicked
      button = Hedron::Button.new("My Button")
      button.on_click = ->(button : Hedron::Button) {
        @actions.["action_1"].call
      }

      # Creates a button that toggles the 'fullscreen' option for this window
      toggleFullscreenButton = Hedron::Button.new("Toggle Fullscreen")
      toggleFullscreenButton.on_click = ->(button : Hedron::Button) {
        set_fullscreen(!is_fullscreen)
      }

      defaultAge = 40

      enteredAge = Hedron::Label.new(defaultAge.to_s)

      ageSlider = Hedron::Slider.new({0, 100})
      ageSlider.value = defaultAge
      ageSlider.on_change = Proc(Hedron::Slider, Nil).new do |slider|
        enteredAge.text = slider.value.to_s
        log slider.value.to_s

        if slider.value < 21
          pop_error(title: "You are too young!", description: "You cannot be under 21.")
          slider.value = 21
        end

      end

      # Adds all of the items in the left row to the grid
      grid.push(Hedron::Label.new("Name"), {0, 0}, cell_info)
      grid.push(Hedron::Label.new("Button"), {0, 1}, cell_info)
      grid.push(Hedron::Label.new("Age"), {0, 2}, cell_info)
      grid.push(Hedron::Label.new("Age Entered"), {0, 3}, cell_info)
      grid.push(Hedron::Label.new("Toggle Fullscreen"), {0, 4}, cell_info)

      # Adds all of the items in the right row to the grid
      grid.push(name, {1, 0}, cell_info)
      grid.push(button, {1, 1}, cell_info)
      grid.push(ageSlider, {1, 2}, cell_info)
      grid.push(enteredAge, {1, 3}, cell_info)
      grid.push(toggleFullscreenButton, {1, 4}, cell_info)

      root.child = grid # Sets the grid to the root group's child

      set_root root # Sets the root node for the window

    end

  end
end
