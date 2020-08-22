require "../bindings.cr"
require "../widget/control.cr"

module Iu
  module Ui
    class ProgressBar < Iu::Widget::Control
      def initialize
        @this = ui_control(UI.new_progress_bar)
        @id = "bar-progress-#{UUID.random}"
      end

      def initialize(@this); end

      def value : Int32
        return UI.progress_bar_value(to_unsafe)
      end

      def value=(val : Int32)
        UI.progress_bar_set_value(to_unsafe, val)
      end

      def to_unsafe
        return @this.as(UI::ProgressBar*)
      end
    end
  end
end
