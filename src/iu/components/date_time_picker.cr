module Iu
  module Components
    # :nodoc:
    class DateTimePicker
      include Component
      Cute.signal changed(picker : DateTimePicker)

      def initialize(@picker : UI::DateTimePicker*)
        super(@picker)
        set_on_changed { changed.emit(self) }
      end

      def self.new
        picker = UI.new_date_time_picker
        new(picker)
      end

      def time
        UI.date_time_picker_time(@picker, out tm)
        Time.from_tm_ptr(pointerof(tm))
      end

      def time=(value : Time)
        tm = value.to_tm_ptr
        UI.date_time_picker_set_time(@picker, tm)
      end

      @on_changed_cb : Proc(Nil)?

      private def set_on_changed(&cb : ->)
        @on_changed_cb = cb
        UI.date_time_picker_on_changed @picker, ->(window, data) {
          data.as(typeof(cb)*).value.call
        }, pointerof(@on_changed_cb)
      end
    end

    # :nodoc:
    class DatePicker < DateTimePicker
      def self.new
        picker = UI.new_date_picker
        new(picker)
      end
    end

    # :nodoc:
    class TimePicker < DateTimePicker
      def self.new
        picker = UI.new_time_picker
        new(picker)
      end
    end
  end
end
