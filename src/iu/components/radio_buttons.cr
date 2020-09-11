module Iu
  module Components
    # :nodoc:
    class RadioButtons
      include Component
      Cute.signal selected(radio_buttons : RadioButtons)

      def initialize(items = [] of String)
        @radio_buttons = UI.new_radio_buttons
        super(@radio_buttons)
        items.each { |item| self.append(item) }
        set_on_selected { selected.emit(self) }
      end

      def append(text : String)
        UI.radio_buttons_append(@radio_buttons, text)
      end

      def selected_index
        UI.radio_buttons_selected(@radio_buttons)
      end

      def selected_index=(value : Bool)
        UI.radio_buttons_set_selected(@radio_buttons, value)
      end

      @on_selected_cb : Proc(Nil)?

      private def set_on_selected(&cb : ->)
        @on_selected_cb = cb
        UI.radio_buttons_on_selected @radio_buttons, ->(window, data) {
          data.as(typeof(cb)*).value.call
        }, pointerof(@on_selected_cb)
      end
    end
  end
end
