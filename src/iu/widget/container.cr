require "./widget.cr"

module Iu::Widget
  # Override this class to have a widget take a single child.
  # An example usage is `Hedron::Window`, which takes any widget and
  # places it into a window, effectively making that widget its child and
  # surrounding it into a window.
  module SingleContainer
    # Sets the only child for a SingleContainer.
    abstract def child=(child : Iu::Widget::Widget)
  end

  # Override this class to have a widget take multiple children.
  # An example usage is `Hedron::Box`, which takes multiple children widgets
  # and stacks them horizontally or vertically into a single widget.
  module MultipleContainer
    # Given an index, delete the nth widget in the MultipleContainer.
    abstract def delete_at(index : Int32)

    # Adds a child to a MultipleContainer.
    abstract def push(child : Iu::Widget::Widget)
  end

  # Override this class to have a widget take multiple children, with each
  # child having a specific String index.
  # An example is `Hedron::Tab`, which takes multiple children widgets and
  # assigns them each to a separate tab, each with their own separate titles
  # as strings.
  module IndexedContainer
    # Sets a child widget with a specific `index`.
    abstract def []=(index : String, child : Iu::Widget::Widget)

    # Deletes a child widget, given its index.
    abstract def delete_at(index : Int32)
  end
end
