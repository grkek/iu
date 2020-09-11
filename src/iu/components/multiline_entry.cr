module Iu
  module Components
    # :nodoc:
    class MultilineEntry
      include Component
      Cute.signal changed(entry : MultilineEntry)

      def initialize(@entry : UI::MultilineEntry*)
        super(@entry)
        set_on_changed { changed.emit(self); 0 }
      end

      def self.new
        entry = UI.new_multiline_entry
        new(entry)
      end

      def append(text : String)
        UI.multiline_entry_append(@entry, text)
      end

      def text
        String.new(UI.multiline_entry_text(@entry))
      end

      def text=(value : String)
        UI.multiline_entry_set_text(@entry, value)
      end

      def read_only?
        UI.multiline_entry_read_only(@entry) > 0
      end

      def read_only=(value : Bool)
        UI.multiline_entry_set_read_only(@entry, value)
      end

      @on_changed_cb : Proc(Nil)?

      private def set_on_changed(&cb : ->)
        @on_changed_cb = cb
        UI.multiline_entry_on_changed @entry, ->(window, data) {
          data.as(typeof(cb)*).value.call
        }, pointerof(@on_changed_cb)
      end
    end

    # :nodoc:
    class NonWrappingMultilineEntry < MultilineEntry
      def self.new
        entry = UI.new_non_wrapping_multlilin_entry
        new(entry)
      end
    end
  end
end
