require "../bindings.cr"
require "../widget/control.cr"

module Iu::Ui
  class HorizontalSeparator < Iu::Widget::Control
    def initialize
      @this = ui_control(UI.new_horizontal_separator)
      @id = "separator-horizontal-#{UUID.random}"
    end

    def initialize(@this); end

    def to_unsafe
      return @this.as(UI::Separator*)
    end
  end

  class VerticalSeparator < Iu::Widget::Control
    def initialize
      @this = UI.new_vertical_separator
      @id = "separator-vertical-#{UUID.random}"
    end

    def initialize(@this); end

    def to_unsafe
      return @this.as(UI::Separator*)
    end
  end
end
