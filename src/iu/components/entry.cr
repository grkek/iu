module Iu
  module Components
    # :nodoc:
    class Entry
      include Component
      Cute.signal changed(entry : Entry)

      def initialize(@entry : UI::Entry*)
        super(@entry)
        set_on_changed { changed.emit(self); 0 }
      end

      def self.new
        entry = UI.new_entry
        new(entry)
      end

      def text
        String.new(UI.entry_text(@entry))
      end

      def text=(value : String)
        UI.entry_set_text(@entry, value)
      end

      def read_only?
        UI.entry_read_only(@entry) > 0
      end

      def read_only=(value : Bool)
        UI.entry_set_read_only(@entry, value)
      end

      @on_changed_cb : Proc(Nil)?

      private def set_on_changed(&cb : ->)
        @on_changed_cb = cb
        UI.entry_on_changed @entry, ->(window, data) {
          data.as(typeof(cb)*).value.call
        }, pointerof(@on_changed_cb)
      end
    end

    # :nodoc:
    class PasswordEntry < Entry
      def self.new
        entry = UI.new_password_entry
        new(entry)
      end
    end

    # :nodoc:
    class SearchEntry < Entry
      def self.new
        entry = UI.new_search_entry
        new(entry)
      end
    end
  end
end
