module Iu
  module Components
    # :nodoc:
    class Button
      include Component
      Cute.signal clicked

      def initialize(text : String)
        @button = UI.new_button(text)
        super(@button)
        set_on_clicked { clicked.emit }
      end

      def text
        String.new(UI.button_text(@button))
      end

      def text=(value : String)
        UI.button_set_text(@button, value)
      end

      @on_clicked_cb : Proc(Nil)?

      private def set_on_clicked(&cb : ->)
        @on_clicked_cb = cb
        UI.button_on_clicked @button, ->(window, data) {
          data.as(typeof(cb)*).value.call
        }, pointerof(@on_clicked_cb)
      end
    end

    # :nodoc:
    class FontButton
      include Component
      Cute.signal changed(button : FontButton)

      def initialize
        @button = UI.new_font_button
        super(@button)
        set_on_changed { changed.emit(self) }
      end

      def font
        UI.font_button_font(@button, out descriptor)
        Font.from_descriptor(descriptor)
      end

      @on_changed_cb : Proc(Nil)?

      private def set_on_changed(&cb : ->)
        @on_changed_cb = cb
        UI.font_button_on_changed @button, ->(button, data) {
          data.as(typeof(cb)*).value.call
        }, pointerof(@on_changed_cb)
      end
    end

    # :nodoc:
    class ColorButton
      include Component
      Cute.signal changed(button : ColorButton)

      def initialize
        @button = UI.new_color_button
        super(@button)
        set_on_changed { changed.emit(self) }
      end

      def color
        UI.color_button_color(@button, out r, out g, out b, out a)
        {red: r, green: g, blue: b, alpha: a}
      end

      def set_color(red, green, blue, alpha)
        UI.color_button_set_color(@button, red, green, blue, alpha)
      end

      @on_changed_cb : Proc(Nil)?

      private def set_on_changed(&cb : ->)
        @on_changed_cb = cb
        UI.color_button_on_changed @button, ->(button, data) {
          data.as(typeof(cb)*).value.call
        }, pointerof(@on_changed_cb)
      end
    end
  end
end
