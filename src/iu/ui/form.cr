require "../bindings.cr"
require "../widget/control.cr"

module Iu::Ui
  class Form < Iu::Widget::Control
    def initialize
      @this = UI.new_form
      @id = "form-#{UUID.random}"
    end

    def initialize(@this); end

    def delete_at(index : Int32)
      UI.form_delete(to_unsafe, index)
    end

    def padded : Bool
      return to_bool(UI.form_padded(to_unsafe))
    end

    def padded=(is_padded : Bool)
      UI.form_set_padded(to_unsafe, to_int(is_padded))
    end

    def push(label : Iu::Ui::Label, widget : Iu::Widget::Widget)
      UI.form_append(to_unsafe, label.to_unsafe, ui_control(widget.control.to_unsafe), to_int(widget.control.stretchy))
    end

    def to_unsafe
      return @this.as(UI::Form*)
    end
  end
end
