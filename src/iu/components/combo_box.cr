module Iu
  module Components
    # :nodoc:
    class ComboBox
      include Component
      Cute.signal selected(combobox : ComboBox)

      def initialize(items = [] of String)
        @combobox = UI.new_combobox
        super(@combobox)
        items.each { |item| append(item) }
        set_on_selected { selected.emit(self) }
      end

      def append(item : String)
        UI.combobox_append(@combobox, item)
      end

      def selected_index
        UI.combobox_selected(@combobox)
      end

      def selected_index=(value : Int32)
        UI.combobox_set_selected(@combobox, value)
      end

      @on_selected_cb : Proc(Nil)?

      private def set_on_selected(&cb : ->)
        @on_selected_cb = cb
        UI.combobox_on_selected @combobox, ->(window, data) {
          data.as(typeof(cb)*).value.call
        }, pointerof(@on_selected_cb)
      end
    end

    # :nodoc:
    class EditableComboBox
      include Component
      Cute.signal changed(combobox : EditableComboBox)

      def initialize(items = [] of String)
        @combobox = UI.new_editable_combobox
        super(@combobox)
        items.each { |item| append(item) }
        set_on_changed { changed.emit(self) }
      end

      def append(item : String)
        UI.editable_combobox_append(@combobox, item)
      end

      def text
        String.new(UI.editable_combobox_text(@combobox))
      end

      def text=(value : String)
        UI.editable_combobox_set_text(@combobox, value)
      end

      @on_changed_cb : Proc(Nil)?

      private def set_on_changed(&cb : ->)
        @on_changed_cb = cb
        UI.editable_combobox_on_changed @combobox, ->(window, data) {
          data.as(typeof(cb)*).value.call
        }, pointerof(@on_changed_cb)
      end
    end
  end
end
