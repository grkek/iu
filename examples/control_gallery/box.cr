require "../../src/iu"

class BoxLayer < Iu::Abstractions::Layer
  def create(*args, **kwargs)
    # This is a direct clone of the Hedron UI control gallery but adapted to the
    # IU structure, which at first might seem cumbersome but is a lot better in the long game.
    vertical_box = create_vertical_box()
    horizontal_box = create_horizontal_box()
    inner_vertical_box = create_vertical_box()
    inner_vertical_box_two = create_vertical_box()
    inner_vertical_box_three = create_vertical_box()
    inner_vertical_box_four = create_vertical_box()

    # Modify the box properties to match the pre-defined design.
    horizontal_box.padded = true
    horizontal_box.stretchy = true
    vertical_box.padded = true
    inner_vertical_box.padded = true
    inner_vertical_box_two.padded = true
    inner_vertical_box_two.stretchy = true
    inner_vertical_box_three.padded = true
    inner_vertical_box_four.padded = true

    store("MainVerticalBox", vertical_box, args.first)
    store("MainHorizontalBox", horizontal_box, args.first)
    store("InnerMainVerticalBox", inner_vertical_box, args.first)
    store("InnerMainVerticalBoxTwo", inner_vertical_box_two, args.first)
    store("InnerMainVerticalBoxThree", inner_vertical_box_three, args.first)
    store("InnerMainVerticalBoxFour", inner_vertical_box_four, args.first)
  end
end
