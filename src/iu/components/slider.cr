module Iu
  module Components
    # :nodoc:
    class Slider
      include Component
      Cute.signal changed(slider : Slider)

      def initialize(min_value, max_value)
        @slider = UI.new_slider(min_value, max_value)
        super(@slider)
        set_on_changed { changed.emit(self); 0 }
      end

      def value=(value : Int32)
        UI.slider_set_value(@slider, value)
      end

      def value
        UI.slider_value(@slider)
      end

      @on_changed_cb : Proc(Nil)?

      private def set_on_changed(&cb : ->)
        @on_changed_cb = cb
        UI.slider_on_changed @slider, ->(window, data) {
          data.as(typeof(cb)*).value.call
        }, pointerof(@on_changed_cb)
      end
    end
  end
end
