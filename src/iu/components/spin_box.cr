module Iu
  module Components
    class Spinbox
      include Component
      Cute.signal changed(spinbox : Spinbox)

      def initialize(min_value, max_value)
        @spinbox = UI.new_spinbox(min_value, max_value)
        super(@spinbox)
        set_on_changed { changed.emit(self); 0 }
      end

      def value=(value : Int32)
        UI.spinbox_set_value(@spinbox, value)
      end

      def value
        UI.spinbox_value(@spinbox)
      end

      @on_changed_cb : Proc(Nil)?

      private def set_on_changed(&cb : ->)
        @on_changed_cb = cb
        UI.spinbox_on_changed @spinbox, ->(window, data) {
          data.as(typeof(cb)*).value.call
        }, pointerof(@on_changed_cb)
      end
    end
  end
end
