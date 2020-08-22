require "../../src/iu"

class GroupLayer < Iu::Abstractions::Layer
  def create(*args, **kwargs)
    basic_controls = create_group("Basic Controls")
    lists = create_group("Lists")
    numbers = create_group("Numbers")

    basic_controls.margined = true
    numbers.margined = true
    lists.margined = true

    store("BasicControlsGroup", basic_controls, args.first)
    store("NumbersGroup", numbers, args.first)
    store("ListsGroup", lists, args.first)
  end
end
