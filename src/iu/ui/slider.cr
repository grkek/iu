require "../bindings.cr"
require "../widget/control.cr"

module Iu::Ui
  class Slider < Iu::Widget::Control
    @@box : Void*?

    def initialize(bounds : Tuple(Int32, Int32))
      @this = ui_control(UI.new_slider(bounds[0], bounds[1]))
      @id = "slider-#{UUID.random}"
    end

    def initialize(@this); end

    def on_change(&block)
      on_change = block
    end

    def on_change=(proc : Proc(Slider, Nil))
      boxed_data = ::Box.box(proc)
      @@box = boxed_data

      new_proc = ->(slider : UI::Slider*, data : Void*) {
        callback = ::Box(Proc(Slider, Nil)).unbox(data)
        callback.call(Slider.new(ui_control(slider)))
      }

      UI.slider_on_changed(to_unsafe, new_proc, boxed_data)
    end

    def value : Int32
      return UI.slider_value(to_unsafe)
    end

    def value=(val : Int32)
      UI.slider_set_value(to_unsafe, val)
    end

    def to_unsafe
      return @this.as(UI::Slider*)
    end
  end
end
