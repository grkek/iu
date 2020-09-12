module Iu
  # :nodoc:
  class Application
    Cute.signal should_quit(app : Application)

    class_getter draw_context : Pointer(UI::DrawContext) { Pointer(UI::DrawContext).malloc(1) }

    # Create a new Iu app
    def initialize
      options = UI::InitOptions.new
      err = UI.init pointerof(options)

      if !ui_nil?(err)
        puts "Failed to initialize the application: #{err}"
        exit 1
      end

      set_on_should_quit { should_quit.emit(self); 0 }
      initialize_component
    end

    def initialize_component; end

    def uninitialze_component; end

    # Start the application main loop
    def start
      UI.main
    end

    # Stop the application main loop
    def stop
      UI.quit
      uninitialze_component
    end

    # Close the application and free resources
    def close
      UI.uninit
      uninitialze_component
    end

    @on_should_quit_cb : Proc(Int32)?

    private def set_on_should_quit(&cb : -> Int32)
      @on_should_quit_cb = cb
      UI.on_should_quit ->(data) {
        data.as(typeof(cb)*).value.call
      }, pointerof(@on_should_quit_cb)
    end
  end
end
