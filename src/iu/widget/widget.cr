require "../any.cr"
require "../render.cr"

module Iu::Widget
  # A widget is the main class that all UI elements in
  # Iu are derived from.
  abstract class Widget
    property parent : Widget?
    property! id : String

    # Checks if another widget is the parent of the widget.
    # ```crystal
    # foo = Iu::Ui::Box.new
    # button = Iu::Ui::Button.new("Button")
    # foo.push(button)
    # button.parent?(foo) # => true
    # ```
    def parent?(widget : Widget) : Bool
      return @parent == widget
    end

    # :no-doc:
    def control : Control
      return self
    end
  end
end
