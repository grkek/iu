require "../bindings.cr"
require "../widget/control.cr"

module Iu::Ui
  class Label < Iu::Widget::Control
    def initialize(text : String)
      @this = ui_control(UI.new_label(text))
      @id = "label-#{UUID.random}"
    end

    def initialize(@this); end

    def text : String
      return String.new(UI.label_text(to_unsafe))
    end

    def text=(label_text : String)
      UI.label_set_text(to_unsafe, label_text)
    end

    def to_unsafe
      return @this.as(UI::Label*)
    end
  end
end
