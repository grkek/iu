module Iu
  module Components
    # :nodoc:
    class Window
      include Component
      Cute.signal closing(window : Window)
      Cute.signal content_size_changed(window : Window)

      def initialize(@window : UI::Window*)
        super(@window)
      end

      def initialize(title : String,
                     width = 800,
                     height = 600,
                     menu_bar = true)
        @window = UI.new_window(title, width, height, menu_bar ? 1 : 0)
        super(@window)

        set_on_closing { closing.emit(self); 0 }
        set_on_content_size_changed { content_size_changed.emit(self) }
      end

      # Get the window's title.
      def title
        String.new(UI.window_title(@window))
      end

      # Set the window's title.
      def title=(value : String)
        UI.window_set_title(@window, value)
      end

      # Get the window's width.
      def width
        UI.window_content_size(@window, out width, out height)
        width
      end

      # Get the window's height.
      def height
        UI.window_content_size(@window, out width, out height)
        height
      end

      # Set the window's width.
      def width=(value : Int32)
        UI.window_set_content_size(@window, width, self.height)
      end

      # Set the window's height.
      def height=(value : Int32)
        UI.window_set_content_size(@window, self.width, height)
      end

      # Returns true if this window is fullscreen
      def fullscreen?
        UI.window_full_screen(@window) > 0
      end

      # Set whether the window is fullscreen.
      def fullscreen=(value : Bool)
        UI.window_set_fullscreen(@window, value)
      end

      # Returns true if this window is borderless.
      def borderless?
        UI.window_borderless(@window) > 0
      end

      # Set whether this window is borderless.
      def borderless=(value : Bool)
        UI.window_set_borderless(@window, value)
      end

      # Adds a control as a child of this window.
      def child=(child : Component)
        UI.window_set_child(@window, child)
      end

      # Returns true if this window is margined.
      def margined?
        UI.window_margined(@window) > 0
      end

      # Set whether this window is margined.
      def margined=(value : Bool)
        UI.window_set_margined(@window, value)
      end

      # Opens an "open file" dialog.
      def open_file
        res = UI.open_file(@window)
        ui_nil?(res) ? nil : String.new(res)
      end

      # Opens a "save file" dialog.
      def save_file
        res = UI.save_file(@window)
        ui_nil?(res) ? nil : String.new(res)
      end

      # Opens a new message dialog (like an alert).
      def show_message(title : String, description : String)
        UI.msg_box(@window, title, description)
      end

      # Opens a new error dialog.
      def show_error(title : String, description : String)
        UI.msg_box_error(@window, title, description)
      end

      @on_closing_cb : Proc(Int32)?

      private def set_on_closing(&cb : -> Int32)
        @on_closing_cb = cb
        UI.window_on_closing @window, ->(window, data) {
          data.as(typeof(cb)*).value.call
        }, pointerof(@on_closing_cb)
      end

      @on_content_size_changed_cb : Proc(Nil)?

      private def set_on_content_size_changed(&cb : ->)
        @on_content_size_changed_cb = cb
        UI.window_on_content_size_changed @window, ->(window, data) {
          data.as(typeof(cb)*).value.call
        }, pointerof(@on_content_size_changed_cb)
      end
    end
  end
end
