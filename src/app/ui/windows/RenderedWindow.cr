require "hedron"
require "baked_file_system"
require "stumpy_png"
require "../resources/scripts/wget.cr"

class FileStorage
  extend BakedFileSystem
  bake_folder "../resources"
end

class RenderedWindow < Hedron::Application
  @window : Hedron::Window?
  @actions : Hash(String, Proc(Nil)) = {"test" => ->{ puts "hello" }}

  def initialize
    options = UI::InitOptions.new
    err = UI.init(pointerof(options))
    unless ui_nil?(err)
      raise Hedron::UIError.new("Error initializing UI: #{String.new(err)}")
    end
  end

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

    compiled_layout = FileStorage.get("layouts/RenderedWindowLayout.hdml").gets_to_end

    main = Hedron::HDML.render(compiled_layout)

    commandtextbox = main.["commandtextbox"].as(Hedron::Entry)
    outputtextbox = main.["statuslabel"].as(Hedron::Label)

    # pbar = main.["myp"].as(Hedron::ProgressBar)

    main["runbutton"].as(Hedron::Button).on_click do |button|
      
      outputtextbox.text = "Snatching files from #{commandtextbox.text} ..."
      outputtextbox.text += "\nSaving to your Documents folder..."

      begin
        output = IO::Memory.new
        Process.run(Scripts::SNATCH_SCRIPT.call(commandtextbox.text.to_s), shell: true, output: output)
        output.close
        outputtextbox.text += "\n#{output.to_s}"
        outputtextbox.text += "\nDone!"
        @window.not_nil!.message(title: "Snatching complete!", description: "The website #{commandtextbox.text} and all of it's assets have been saved to your Documents folder.")
        @actions["AlertWhenDone"].call
      rescue exception
        outputtextbox.text += "Error!"
      end
      

    end


    @window = main["window"].as(Hedron::Window)
    @window.not_nil!.on_close = ->on_closing(Hedron::Window)

    @window.not_nil!.show
  end
end
