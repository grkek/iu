module Iu
  module Components
    # :nodoc:
    class Checkbox
      include Component
      Cute.signal toggled(checkbox : Checkbox)

      def initialize(text : String)
        @checkbox = UI.new_checkbox(text)
        super(@checkbox)
        set_on_toggled { toggled.emit(self) }
      end

      def text
        String.new(UI.checkbox_text(@checkbox))
      end

      def text=(value : String)
        UI.checkbox_set_text(@checkbox, value)
      end

      def checked?
        UI.checkbox_checked(@checkbox) > 0
      end

      def checked=(value : Bool)
        UI.checkbox_set_checked(@checkbox, value)
      end

      @on_toggled_cb : Proc(Nil)?

      private def set_on_toggled(&cb : ->)
        @on_toggled_cb = cb
        UI.checkbox_on_toggled @checkbox, ->(window, data) {
          data.as(typeof(cb)*).value.call
        }, pointerof(@on_toggled_cb)
      end
    end
  end
end
