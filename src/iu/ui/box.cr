require "../bindings.cr"
require "../widget/container.cr"
require "../widget/control.cr"

module Iu
  module Ui
    abstract class Box < Iu::Widget::Control
      include Iu::Widget::MultipleContainer

      def delete_at(index : Int32)
        UI.box_delete(to_unsafe, index)
      end

      def padded : Bool
        return to_bool(UI.box_padded(to_unsafe))
      end

      def padded=(is_padded : Bool)
        UI.box_set_padded(to_unsafe, to_int(is_padded))
      end

      def push(child : Iu::Widget::Widget)
        child.parent = self
        UI.box_append(to_unsafe, ui_control(child.control.to_unsafe), to_int(child.control.stretchy))
      end

      def push(*children : Iu::Widget::Widget)
        children.each { |child| push(child) }
      end
    end

    class VerticalBox < Box
      def initialize
        @this = ui_control(UI.new_vertical_box)
        @id = "box-vertical-#{UUID.random}"
      end

      def initialize(@this); end

      def to_unsafe : UI::Box*
        return @this.as(UI::Box*)
      end
    end

    class HorizontalBox < Box
      def initialize
        @this = ui_control(UI.new_horizontal_box)
        @id = "box-horizontal-#{UUID.random}"
      end

      def initialize(@this); end

      def to_unsafe : UI::Box*
        return @this.as(UI::Box*)
      end
    end
  end
end
