require "hedron"

class MainWindow < Hedron::Application
  @window : Hedron::Window?

  def initialize
    options = UI::InitOptions.new
    err = UI.init(pointerof(options))
    unless ui_nil?(err)
      raise Hedron::UIError.new("Error initializing UI: #{String.new(err)}")
    end
  end

  @actions : Hash(String, Proc(Nil)) = { "test" => ->{puts "hello"} }

  def load_action_callbacks(callbacks : Hash(String, Proc(Nil)))
    @actions = callbacks
  end

  def on_closing(this)
    this.destroy
    self.stop
    return false
  end

  def should_quit
    @window.not_nil!.destroy
    return true
  end

  def draw

    self.on_stop = ->should_quit

    @window = Hedron::Window.new("Grid Gallery", {640, 480}, menubar: true)
    @window.not_nil!.on_close = ->on_closing(Hedron::Window)

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
    button.on_click {@actions.["action1"].call}
    grid.push(button, {1, 1}, cell_info)

    age = Hedron::Slider.new({0, 100})
    age.value = 40
    grid.push(age, {1, 3}, cell_info)

    @window.not_nil!.child = grid
    @window.not_nil!.show
  end
end
