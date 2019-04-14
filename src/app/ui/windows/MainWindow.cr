module Windows

  class MainWindow < Cocoa::ViewController

    # Window dimensions
    @windowWidth : Int32 = 640
    @windowHeight : Int32 = 480

    # Gets the default window name option from config/App.yml
    @windowName : String = Cocoa::CONFIG["app"]["ui"]["default_window_name"].to_s

    @hasMenuBar = false

    # This implamentation does not work
    def build

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
      age.on_change = Proc(Hedron::Slider, Nil).new do |slider|
        puts slider.value.to_s
      end
      grid.push(age, {1, 3}, cell_info)

      set_root grid

    end

  end
end
