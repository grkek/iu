require "../bindings.cr"
require "../widget/control.cr"

module Iu
  module Ui
    class DateTimePicker < Iu::Widget::Control
      def initialize
        @this = ui_control(UI.new_date_time_picker)
        @id = "picker-date-time-#{UUID.random}"
      end

      def initialize(@this); end

      def to_unsafe
        return @this.as(UI::DateTimePicker*)
      end
    end

    class DatePicker < DateTimePicker
      def initialize
        @this = ui_control(UI.new_date_picker)
        @id = "picker-date-#{UUID.random}"
      end
    end

    class TimePicker < DateTimePicker
      def initialize
        @this = ui_control(UI.new_time_picker)
        @id = "picker-time-#{UUID.random}"
      end
    end
  end
end
