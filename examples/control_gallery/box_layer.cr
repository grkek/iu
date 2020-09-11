module Example
  # :nodoc:
  class BoxLayer < Iu::Abstractions::Layer
    property horizontal_box : HorizontalBox
    property vertical_box : VerticalBox
    property inner_vertical_box : VerticalBox
    property inner_vertical_box_two : VerticalBox

    def initialize
      @inner_vertical_box = VerticalBox.new
      @inner_vertical_box_two = VerticalBox.new
      @vertical_box = VerticalBox.new
      @horizontal_box = HorizontalBox.new
    end

    def create(**kwargs)
      window = kwargs
        .["parent"]
        .window

      vertical_box.padded = true
      horizontal_box.padded = true
      inner_vertical_box.padded = true
      inner_vertical_box_two.padded = true

      window.child = vertical_box
      vertical_box.append horizontal_box, true
    end

    def destroy(**kwargs)
      exit(0)
    end
  end
end
